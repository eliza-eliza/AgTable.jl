import React, { useCallback, useMemo, useState, forwardRef } from "react";
import { AgGridReact } from "ag-grid-react";
import "ag-grid-community/styles/ag-grid.css";
import "ag-grid-community/styles/ag-theme-quartz.css";
import "ag-grid-enterprise";
import "./aggrid.css";
import { getUrlCellRenderer, getCellStyle, getFilterItemRenderer, getFilterComponent } from "./utils/aggrid_utils.jsx";
import { fetchRowData, fetchFilterValues, getFilterHeight, generateFilterLayout } from "./utils/utils.js";
import ColumnFilter from "./custom_filters/column_filter.jsx";

const AgGridUrl = ({ table, height, index, uuidKey }) => {
    const [filters, setFilters] = useState(false);
    const [filterLayout, setFilterLayout] = useState(null);
    const [filterHeight, setFilterHeight] = useState(null);
    const initialState = JSON.parse(localStorage.getItem(uuidKey + index));
    const initialWidth = localStorage.getItem(uuidKey + index + "width");

    const columnDefs = useMemo(() => {
        const colDefs = table.columnDefs.map((coldef) => {
            const colDef = {
                field: coldef.fieldName,
                headerName: coldef.headerName,
                initialHide: !coldef.visible,
                cellRenderer: (params) => getUrlCellRenderer(params, coldef),
                cellStyle: (params) => getCellStyle(params, coldef),
                width: coldef.width,
                flex: !coldef.width && table.flex && 1,
                initialSort: coldef.defaultSort,
                filter: false,
            };

            if (coldef.filter) {
                colDef.filter = getFilterComponent(coldef, table.rowData.url);
                if (coldef.filter == "text") {
                    colDef.filterParams = {
                        buttons: ["reset", "apply"],
                        cellRenderer: (params) => getFilterItemRenderer(params, coldef),
                        values: async (params) => {
                            params.success(await getSetFilterValues(params, coldef.fieldName));
                        },
                    }
                }
            }

            return colDef;
        });

        if (table.columnFilter) {
            colDefs.push({
                field: "columnFilter",
                hide: true,
                filter: forwardRef(({ api }, ref) => <ColumnFilter api={api} filterLayout={filterLayout} filterHeight={filterHeight} ref={ref} />),
            });
        };

        const filterLayout = generateFilterLayout(table.columnDefs, table.columnFilter);
        const filterHeight = getFilterHeight(table.columnDefs, table.columnFilter);
        setFilterLayout(filterLayout);
        setFilterHeight(filterHeight);
        setFilters(table.columnDefs.some(colDef => colDef.filter) || table.columnFilter);
        return colDefs;
    }, [table]);

    const defaultColDef = useMemo(() => ({
        editable: false,
        sortable: true,
        resizable: table.resize,
        filter: true,
        minWidth: 20,
    }), [table]);

    const sideBar = useMemo(() => ({
        toolPanels: [
            {
                id: "filters",
                labelDefault: 'filters',
                iconKey: 'filter',
                toolPanel: 'agFiltersToolPanel',
                toolPanelParams: {
                    expandFilters: true,
                    suppressFilterSearch: false,
                    suppressSyncLayoutWithGrid: true,
                    suppressFiltersToolPanel: true
                },
                width: initialWidth && parseFloat(initialWidth) || 223,
            },
        ],
        defaultToolPanel: 'filters',
    }), [table, initialWidth]);

    const handleFirstDataRendered = useCallback((params) => {
        if (initialState) return;

        table.columnDefs.map((column) => {
            if (column.filterInclude && column.filterInclude.length) {
                applyFilter(params, column.fieldName, column.filterInclude.filter(value => !column.filterExclude.includes(value)));
            } else if (column.filterExclude && column.filterExclude.length) {
                let uniqueValues = {};
                params.api.forEachNode(elem => {
                    const value = elem.data[column.fieldName];
                    uniqueValues[value] = elem.displayed || uniqueValues[value];
                });
                const filteredValues = Object.keys(uniqueValues).filter(value => uniqueValues[value]);
                applyFilter(params, column.fieldName, filteredValues.filter(value => !column.filterExclude.includes(value)));
            }
        });
    }, [table]);

    const applyFilter = (params, colId, values) => {
        params.api.setColumnFilterModel(colId, { type: 'set', values: values, })
            .then(() => params.api.onFilterChanged());
    };

    const handleGridReady = (params) => {
        if (!filters) return;

        const filtersToolPanel = params.api.getToolPanelInstance("filters");
        filtersToolPanel?.expandFilters();
        filterLayout && filtersToolPanel?.setFilterLayout([filterLayout]);

        let filtersList = document.getElementsByClassName("ag-filter-toolpanel-instance");
        Array.from(filtersList).forEach((item, index) => {
            if (index < filterHeight.len) {
                item.style.height = filterHeight.filterHeight;
            }
        });
    };

    const handleFilterChanged = useCallback((params) => {
        const allColumns = params.api.getAllGridColumns();
        const colId = params.columns[0]?.colId;
        allColumns.forEach(col => {
            if (col.getColDef().filter === "agSetColumnFilter") {
                params.api.getColumnFilterInstance(col.getColId()).then(instance => {
                    if (instance && colId && col.getColId() !== colId) {
                        instance.refreshFilterValues();
                    }
                });
            }
        });
    }, [table]);

    const handleStateUpdated = (params) => {
        localStorage.setItem(uuidKey + index, JSON.stringify(params.state));
        const filtersToolPanel = params.api.getToolPanelInstance("filters");
        if (filtersToolPanel) {
            localStorage.setItem(uuidKey + index + "width", filtersToolPanel.eGui.clientWidth);
        }
    };

    const getRows = async (params) => {
        const data = await fetchRowData(table.rowData.url, params.request);
        params.success({ rowData: data, getLastRowIndex: params.request.startRow + data.length });
    };

    const getSetFilterValues = async (params, columnId) => {
        const filterModel = params.api.getFilterModel();
        return await fetchFilterValues(table.rowData.url, columnId, filterModel);
    };

    return (
        <div className="ag-theme-quartz aggrid" style={height}>
            <AgGridReact
                key={index}
                rowModelType="serverSide"
                serverSideDatasource={{ getRows: getRows }}
                maxBlocksInCache={0}
                columnDefs={columnDefs}
                defaultColDef={defaultColDef}
                sideBar={filters && sideBar}
                initialState={initialState}
                headerHeight={table.headerHeight}
                rowHeight={table.rowHeight}
                onGridReady={handleGridReady}
                onFirstDataRendered={handleFirstDataRendered}
                onStateUpdated={handleStateUpdated}
                onFilterChanged={handleFilterChanged}
            />
        </div>
    );
};

export default AgGridUrl;
