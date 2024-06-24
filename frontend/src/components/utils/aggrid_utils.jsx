import React, { forwardRef } from 'react';
import { formatDate, formatNumber } from './utils.js';
import * as util from 'util';
import NumberFilter from "../custom_filters/number_filter.jsx";
import DateFilter from "../custom_filters/date_filter.jsx";

export const getCellRenderer = (params, column) => {
    let value = params.value;

    if (value === "(Select All)") {
        return <div className="cell" dangerouslySetInnerHTML={{ __html: "(All)" }}></div>;
    }

    if (column.formatterType === "number") {
        value = formatNumber(value, column.formatter);
    } else if (column.formatterType === "date") {
        value = formatDate(value, column.formatter);
    }

    return (
        <div
            className="cell"
            style={{ backgroundColor: column.rectBackground }}
            dangerouslySetInnerHTML={{ __html: util.format(column.strFormat, value) }}
        />
    );
};

export const getUrlCellRenderer = (params, column) => {
    let value = params.value;

    if (value === "(Select All)") {
        return <div className="cell" dangerouslySetInnerHTML={{ __html: "(All)" }}></div>;
    }

    if (column.formatterType === "number") {
        value = formatNumber(value, column.formatter);
    } else if (column.formatterType === "date") {
        value = formatDate(value, column.formatter);
    }

    return (
        <div className="ag-cell-wrapper" role="presentation">
            <span role="presentation" className="ag-cell-value">
                <div
                    className="cell"
                    style={{ backgroundColor: column.rectBackground }}
                    dangerouslySetInnerHTML={{ __html: util.format(column.strFormat, value) }}
                />    
            </span>
        </div>
    );
}

export const getFilterItemRenderer = (params, column) => {
    let value = params.value;
    if (value === "(Select All)") {
        return <div className="cell" dangerouslySetInnerHTML={{ __html: "(All)" }}></div>;
    }
    return (
        <div
            className="cell"
            dangerouslySetInnerHTML={{ __html: util.format(column.strFormat, value) }}
        />
    );
};

export const getCellStyle = (params, column) => {
    const style = {
        color: column.color,
        background: column.cellBackground,
        justifyContent: column.textAlign,
    };

    if (column.threshold) {
        style.color = params.value >= column.threshold.value ? column.threshold.colorUp : column.threshold.colorDown;
    }
    if (column.colorMap) {
        Object.entries(column.colorMap).forEach(([value, color]) => {
            if (params.value === value) style.color = color;
        });
    }

    return style;
};

export const getFilterComponent = (coldef, url=null) => {
    switch (coldef.filter) {
        case "text":
            return "agSetColumnFilter";
        case "number":
            return forwardRef(({ column, api }, ref) => (
                <NumberFilter column={column} api={api} formatter={coldef.formatter} url={url} ref={ref} />
            ));
        case "date":
            return forwardRef(({ column, api }, ref) => (
                <DateFilter column={column} api={api} formatter={coldef.formatter} url={url} ref={ref} />
            ));
        default:
            return undefined;
    }
};

