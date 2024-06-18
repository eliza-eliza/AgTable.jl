using AgTables

table = ag_table(
    AGURL("http://127.0.0.1:8080/currency"; page_size = 20),
    AgStringColumnDef(
        field_name = "currency_code",
        filter = true,
    ),
    AgStringColumnDef(
        field_name = "status",
        filter = true,
    ),
    AgNumberColumnDef(
        field_name = "id",
        filter = true,
    ),
)

ag_show(table)

