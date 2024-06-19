using AgTables

table1 = ag_table(
    ag_currencies_sample_data(),
    AgStringColumnDef(
        field_name = "currency_code",
        filter = true,
    ),
    AgNumberColumnDef(
        field_name = "market_cap",
        filter = true,
    );
    name = "Currency"
)

table2 = ag_table(
    parse_csv(read(joinpath(@__DIR__, "./currencies_with_status_data.csv"))),
    AgStringColumnDef(
        field_name = "currency_code",
        filter = true,
    ),;
    name = "Id"
)

ag_show(ag_panel(table1, table2))
