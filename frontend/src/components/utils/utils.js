const pad = (num, size) => num.toString().padStart(size, '0');

export function displayTimeString(time) {
    const { date, nsRem } = {
        date: new Date(time),
        nsRem: time % 1000,
    };
    return (
        pad(date.getUTCHours(), 2) +
        ':' +
        pad(date.getUTCMinutes(), 2) +
        ':' +
        pad(date.getUTCSeconds(), 2) +
        '.' +
        pad(nsRem, 3)
    );
}

export function displayDateString(time) {
    const { date, nsRem } = { date: new Date(time), nsRem: time % 1000 };
    return (
        pad(date.getUTCDate(), 2) +
        '.' +
        pad(date.getUTCMonth() + 1, 2) +
        '.' +
        date.getFullYear()
    );
}

export function displayDateTimeString(time) {
    const { date, nsRem } = {
        date: new Date(time),
        nsRem: time % 1000,
    };
    return (
        pad(date.getUTCDate(), 2) +
        '.' +
        pad(date.getUTCMonth() + 1, 2) +
        '.' +
        date.getFullYear() +
        'T' +
        pad(date.getUTCHours(), 2) +
        ':' +
        pad(date.getUTCMinutes(), 2) +
        ':' +
        pad(date.getUTCSeconds(), 2) +
        '.' +
        pad(nsRem, 3)
    );
}

export function formattedDateAndTime(timestamp) {
    if (!timestamp) return ['', ''];
    const dateObj = new Date(timestamp);

    const year = dateObj.getFullYear();
    const month = dateObj.toLocaleString('default', { month: 'short' });
    const date = pad(dateObj.getUTCDate(), 2);
    const formattedDate = `${date} ${month} ${year}`;

    const hours = pad(dateObj.getUTCHours(), 2);
    const minutes = pad(dateObj.getUTCMinutes(), 2);
    const seconds = pad(dateObj.getUTCSeconds(), 2);
    const formattedTime = `${hours}:${minutes}:${seconds}`;

    return [formattedDate, formattedTime];
}

export function parseDateTimeValue(dateTimeString, formatter) {
    const [datePart, timePart] = dateTimeString.split('T');
    const [day, month, year] = datePart.split('.').map(Number);
    const [hours, minutes, seconds] = (timePart ? timePart.split(':') : []);
    const [sec, ms] = seconds.split('.').map(Number);
    let dateObject;

    switch (formatter) {
        case 'datetime':
            dateObject = new Date(year, month - 1, day, hours, minutes);
            break;
        case 'date':
            dateObject = new Date(year, month - 1, day);
            break;
        case 'time':
            dateObject = new Date(Date.UTC(1970, 0, 1, Number(hours), Number(minutes), sec, ms));
            break;
        default:
            return null;
    }

    if (formatter == 'time') return extractTimeInMilliseconds(dateObject);
    return dateObject.getTime();
}

export function extractTimeInMilliseconds(timestamp) {
    const date = new Date(timestamp);

    return date.getUTCHours() * 60 * 60 * 1000 +
        date.getUTCMinutes() * 60 * 1000 +
        date.getUTCSeconds() * 1000 +
        date.getUTCMilliseconds();
}

export function formatNumber(value, formatter) {
    if (isNaN(Number(value))) return value;

    const settings = {
        useGrouping: formatter.separator,
        style: formatter.style,
        currencyDisplay: 'narrowSymbol',
        minimumFractionDigits: formatter.minimumFractionDigits,
        maximumFractionDigits: formatter.maximumFractionDigits,
        ...(formatter.short && { notation: 'compact', compactDisplay: 'short' }),
        ...(formatter.currency && { currency: formatter.currency }),
    };

    return new Intl.NumberFormat('en-GB', settings).format(Number(value));
}


export function formatDate(value, formatter) {
    switch (formatter) {
        case 'datetime':
            return displayDateTimeString(value);
        case 'date':
            return displayDateString(value);
        case 'time':
            return displayTimeString(value);
        default:
            return value;
    }
}

export async function fetchData(url, params) {
    try {
        const response = await fetch(url + params);
        return await response.json();
    } catch (error) {
        console.error('Error loading data', error);
        return [];
    }
}

function getStringParams(model) {
    if (!model) return '';
    return Object.entries(model)
        .map(([key, value]) => {
            if (value.min !== undefined && value.max !== undefined) {
                return `${key}_min=${value.min}&${key}_max=${value.max}`;
            } else if (Array.isArray(value.values)) {
                return `${key}=${value.values.join(',')}`;
            }
            return '';
        })
        .filter(Boolean)
        .join('&');
}

export async function fetchRowData(url, pageSize, startRow, filterModel, sortModel) {
    let filters = getStringParams(filterModel);
    const sort = sortModel?.map(({ colId, sort }) => `sort_${colId}=${sort}`).join('&') || '';

    return await fetchData(
        url,
        `?page=${startRow / pageSize + 1}&page_size=${pageSize}&${filters}&${sort}`
    );
}

export async function fetchFilterValues(url, colId) {
    return await fetchData(url, `/unique_values?column=${colId}`);
}

export function getFilterHeight(colDef, isColumnFilter) {
    const textFields = colDef.filter(coldef => coldef.filter === "text").map(coldef => coldef.fieldName);
    const otherFilterCount = colDef.filter(coldef => coldef.filter === "number" || coldef.filter === "date").length;
    let setFilterCount = textFields.length + (isColumnFilter ? 1 : 0);
    return { len: setFilterCount, filterHeight: `calc((100% - ${otherFilterCount} * 70px) / ${setFilterCount})` };
};

export function generateFilterLayout(columnDef, isColumnFilter) {
    const filtersType = { text: [], number: [], date: [] };
    columnDef.forEach(coldef => {
        if (coldef.filter) filtersType[coldef.filter].push(coldef.fieldName);
    });

    const filterLayout = {
        children: [
            ...filtersType.text.map(filter => ({ field: filter })),
            ...(isColumnFilter ? [{ field: "columnFilter" }] : []),
            ...filtersType.number.map(filter => ({ field: filter })),
            ...filtersType.date.map(filter => ({ field: filter }))
        ]
    };

    return filterLayout;
};
