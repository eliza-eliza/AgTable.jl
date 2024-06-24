using AgTables

coldefs = ag_define_headers(["id", "currency_code", "exchange_rate", "market_cap", "daily_volume", "status"])

table = ag_table(
    AGURL("http://127.0.0.1:8080/currency"),
    coldefs...,
    AgStringColumnDef(
        field_name = "currency_code",
        filter = true,
    ),
    AgStringColumnDef(
        field_name = "status",
        filter = true,
        rect_background = "#eeeeee",
        color_map = Dict(
                    "Active" => "green",
                    "Not Found" => "black",
                    "Not Active" => "red",
                ),
    ),
    AgNumberColumnDef(
        field_name = "id",
        filter = true,
    ),
)

ag_show(table)
