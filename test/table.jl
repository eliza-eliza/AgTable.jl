# runtests/table

@testset verbose = true "Tuple data" begin

    values_tuples = [
        (a = 1, b = DateTime(2024), c = "text"),
        (a = 1, b = DateTime(2024), c = "text"),
        (a = 1, b = DateTime(2024), c = "text"),
    ]

    string_tuples = [
        (a = "1", b = "2024-01-01", c = "text"),
        (a = "1", b = "2024-01-01", c = "text"),
        (a = "1", b = "2024-01-01", c = "text"),
    ]

    mixed_tuples = [values_tuples; string_tuples]

    @testset "Case №1: Default tables" begin
        table = ag_table(
            values_tuples,
            name = "values_tuples",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "values_tuples",
            row_data = [
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            string_tuples,
            name = "string_tuples",
            resize = true,
            flex = false,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "string_tuples",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
            ],
            resize = true,
            flex = false,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_tuples,
            name = "mixed_tuples",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_tuples",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result
    end

    @testset "Case №2: Custom tables" begin
        table = ag_table(
            mixed_tuples,
            AgNumberColumnDef(
                field_name = "a",
                header_name = "A",
                filter = true,
                default_sort = nothing,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_RIGHT,
                color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                formatter = AGFormatter(
                    short = true,
                    style = AG_PERCENT,
                    currency = AgTables.USD,
                    separator = true,
                    minimum_fraction_digits = 1,
                    maximum_fraction_digits = 2,
                ),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_tuples",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_tuples",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => 1),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = [
                AgNumberColumnDef(
                    field_name = "a",
                    header_name = "A",
                    filter = true,
                    default_sort = nothing,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_RIGHT,
                    color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                    formatter = AGFormatter(
                        short = true,
                        style = AG_PERCENT,
                        currency = AgTables.USD,
                        separator = true,
                        minimum_fraction_digits = 1,
                        maximum_fraction_digits = 2,
                    ),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_tuples,
            AgTimeColumnDef(
                field_name = "b",
                header_name = "B",
                filter = true,
                default_sort = nothing,
                date_formatter = AG_DATE,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map = Dict(Date(2024) => "blue", Date(2025) => "blue"),
                threshold = AGThreshold(Date(2024); color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_tuples",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_tuples",
            row_data = [
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => "1"),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => "1"),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => "1"),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgTimeColumnDef(
                    field_name = "b",
                    header_name = "B",
                    filter = true,
                    default_sort = nothing,
                    date_formatter = AG_DATE,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map = Dict(Date(2024) => "blue", Date(2025) => "blue"),
                    threshold = AGThreshold(Date(2024); color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_tuples,
            AgStringColumnDef(
                field_name = "c",
                header_name = "C",
                filter = true,
                default_sort = nothing,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map = Dict("text" => "blue", "txt" => "blue"),
                threshold = AGThreshold("t"; color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_tuples",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_tuples",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "c",
                    header_name = "C",
                    filter = true,
                    default_sort = nothing,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map = Dict("text" => "blue", "txt" => "blue"),
                    threshold = AGThreshold("t"; color_up = "#22ab94", color_down = "#f23645"),
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_tuples,
            AgNumberColumnDef(
                field_name = "a",
                header_name = "A",
                filter = true,
                default_sort = nothing,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_RIGHT,
                color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                formatter = AGFormatter(
                    short = true,
                    style = AG_PERCENT,
                    currency = AgTables.USD,
                    separator = true,
                    minimum_fraction_digits = 1,
                    maximum_fraction_digits = 2,
                ),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            ),
            AgTimeColumnDef(
                field_name = "b",
                header_name = "B",
                filter = true,
                default_sort = nothing,
                date_formatter = AG_DATE,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map = Dict(Date(2024) => "blue", Date(2025) => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            ),
            AgStringColumnDef(
                field_name = "c",
                header_name = "C",
                filter = true,
                default_sort = nothing,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map = Dict("text" => "blue","txt" => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_tuples",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_tuples",
            row_data = [
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1.0),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1.0),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1.0),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgNumberColumnDef(
                    field_name = "a",
                    header_name = "A",
                    filter = true,
                    default_sort = nothing,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_RIGHT,
                    color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                    formatter = AGFormatter(
                        short = true,
                        style = AG_PERCENT,
                        currency = AgTables.USD,
                        separator = true,
                        minimum_fraction_digits = 1,
                        maximum_fraction_digits = 2,
                    ),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgTimeColumnDef(
                    field_name = "b",
                    header_name = "B",
                    filter = true,
                    default_sort = nothing,
                    date_formatter = AG_DATE,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map = Dict(Date(2024) => "blue", Date(2025) => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgStringColumnDef(
                    field_name = "c",
                    header_name = "C",
                    filter = true,
                    default_sort = nothing,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map = Dict("text" => "blue","txt" => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
            ],
        )

        @test table == result
    end
end

@testset verbose = true "Dict data" begin

    values_dicts = [
        Dict{String,Any}("a" => 1, "b" => DateTime(2024), "c" => "text"),
        Dict{String,Any}("a" => 1, "b" => DateTime(2024), "c" => "text"),
        Dict{String,Any}("a" => 1, "b" => DateTime(2024), "c" => "text"),
    ]

    string_dicts = [
        Dict{String,Any}("a" => "1", "b" => "2024-01-01", "c" => "text"),
        Dict{String,Any}("a" => "1", "b" => "2024-01-01", "c" => "text"),
        Dict{String,Any}("a" => "1", "b" => "2024-01-01", "c" => "text"),
    ]

    mixed_dicts = [values_dicts; string_dicts]
    @testset "Case №1: Default tables" begin
        table = ag_table(
            values_dicts,
            name = "values_dicts",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "values_dicts",
            row_data = [
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            string_dicts,
            name = "string_dicts",
            resize = true,
            flex = false,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "string_dicts",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
            ],
            resize = true,
            flex = false,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_dicts,
            name = "mixed_dicts",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_dicts",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result
    end

    @testset "Case №2: Custom tables" begin
        table = ag_table(
            mixed_dicts,
            AgNumberColumnDef(
                field_name = "a",
                header_name = "A",
                filter = true,
                default_sort = AG_ASC,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_RIGHT,
                color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_dicts",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_dicts",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => 1),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgNumberColumnDef(
                    field_name = "a",
                    header_name = "A",
                    filter = true,
                    default_sort = AG_ASC,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_RIGHT,
                    color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_dicts,
            AgTimeColumnDef(
                field_name = "b",
                header_name = "B",
                filter = true,
                default_sort = AG_DESC,
                date_formatter = AG_DATE,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map =  Dict(Date(2024) => "blue", Date(2025) => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_dicts",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_dicts",
            row_data = [
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => "1"),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => "1"),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => "1"),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgTimeColumnDef(
                    field_name = "b",
                    header_name = "B",
                    filter = true,
                    default_sort = AG_DESC,
                    date_formatter = AG_DATE,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map = Dict(Date(2024) => "blue", Date(2025) => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_dicts,
            AgStringColumnDef(
                field_name = "c",
                header_name = "C",
                filter = true,
                default_sort = nothing,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map = Dict("text" => "blue", "txt" => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_dicts",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_dicts",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "c",
                    header_name = "C",
                    filter = true,
                    default_sort = nothing,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map = Dict("text" => "blue", "txt" => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_dicts,
            AgNumberColumnDef(
                field_name = "a",
                header_name = "A",
                filter = true,
                default_sort = nothing,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_RIGHT,
                color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            ),
            AgTimeColumnDef(
                field_name = "b",
                header_name = "B",
                filter = true,
                default_sort = nothing,
                date_formatter = AG_DATE,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map =  Dict(Date(2024) => "blue", Date(2025) => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            ),
            AgStringColumnDef(
                field_name = "c",
                header_name = "C",
                filter = true,
                default_sort = nothing,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map = Dict("text" => "blue", "txt" => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_dicts",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_dicts",
            row_data = [
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1.0),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1.0),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1.0),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "c",
                    header_name = "C",
                    filter = true,
                    default_sort = nothing,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map = Dict("text" => "blue", "txt" => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgTimeColumnDef(
                    field_name = "b",
                    header_name = "B",
                    filter = true,
                    default_sort = nothing,
                    date_formatter = AG_DATE,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map =  Dict(Date(2024) => "blue", Date(2025) => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgNumberColumnDef(
                    field_name = "a",
                    header_name = "A",
                    filter = true,
                    default_sort = nothing,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_RIGHT,
                    color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
            ],
        )

        @test table == result
    end
end

@testset verbose = true "Struct data" begin

    struct Foo
        a::Union{Int64,String}
        b::Union{DateTime,String}
        c::String
    end

    values_structs = [
        Foo(1, DateTime(2024), "text"),
        Foo(1, DateTime(2024), "text"),
        Foo(1, DateTime(2024), "text"),
    ]

    string_structs = [
        Foo("1", "2024-01-01", "text"),
        Foo("1", "2024-01-01", "text"),
        Foo("1", "2024-01-01", "text"),
    ]

    mixed_structs = [values_structs; string_structs]

    @testset "Case №1: Default tables" begin
        table = ag_table(
            values_structs,
            name = "values_structs",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "values_structs",
            row_data = [
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            string_structs,
            name = "string_structs",
            resize = true,
            flex = false,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "string_structs",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
            ],
            resize = true,
            flex = false,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_structs,
            name = "mixed_structs",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_structs",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result
    end

    @testset "Case №2: Custom tables" begin
        table = ag_table(
            mixed_structs,
            AgNumberColumnDef(
                field_name = "a",
                header_name = "A",
                filter = true,
                default_sort = nothing,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_RIGHT,
                color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_structs",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_structs",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => 1),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgNumberColumnDef(
                    field_name = "a",
                    header_name = "A",
                    filter = true,
                    default_sort = nothing,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_RIGHT,
                    color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_structs,
            AgTimeColumnDef(
                field_name = "b",
                header_name = "B",
                filter = true,
                default_sort = nothing,
                date_formatter = AG_DATE,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map =  Dict(Date(2024) => "blue", Date(2025) => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_structs",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_structs",
            row_data = [
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => "1"),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => "1"),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => "1"),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgTimeColumnDef(
                    field_name = "b",
                    header_name = "B",
                    filter = true,
                    default_sort = nothing,
                    date_formatter = AG_DATE,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map =  Dict(Date(2024) => "blue", Date(2025) => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgStringColumnDef(;
                    field_name = "c",
                    header_name = "c",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_structs,
            AgStringColumnDef(
                field_name = "c",
                header_name = "C",
                filter = true,
                default_sort = nothing,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map = Dict("text" => "blue", "txt" => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_structs",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_structs",
            row_data = [
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
                Dict{String,Any}("c" => "text", "b" => "2024-01-01", "a" => "1"),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "a",
                    header_name = "a",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "b",
                    header_name = "b",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "c",
                    header_name = "C",
                    filter = true,
                    default_sort = nothing,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map = Dict("text" => "blue", "txt" => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
            ],
        )

        @test table == result

        table = ag_table(
            mixed_structs,
            AgNumberColumnDef(
                field_name = "a",
                header_name = "A",
                filter = true,
                default_sort = nothing,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_RIGHT,
                color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            ),
            AgTimeColumnDef(
                field_name = "b",
                header_name = "B",
                filter = true,
                default_sort = nothing,
                date_formatter = AG_DATE,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map =  Dict(Date(2024) => "blue", Date(2025) => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            ),
            AgStringColumnDef(
                field_name = "c",
                header_name = "C",
                filter = true,
                default_sort = nothing,
                width = 500,
                cell_background = "#111",
                rect_background = "#222",
                color = "#333",
                text_align = AG_LEFT,
                color_map = Dict("text" => "blue", "txt" => "blue"),
                threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
            );
            name = "mixed_structs",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "mixed_structs",
            row_data = [
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => 1704067200000, "a" => 1),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1.0),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1.0),
                Dict("c" => "text", "b" => DateTime("2024-01-01T00:00:00"), "a" => 1.0),
            ],
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgNumberColumnDef(
                    field_name = "a",
                    header_name = "A",
                    filter = true,
                    default_sort = nothing,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_RIGHT,
                    color_map = Dict(1 => "blue", 2 => "blue", 3 => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgTimeColumnDef(
                    field_name = "b",
                    header_name = "B",
                    filter = true,
                    default_sort = nothing,
                    date_formatter = AG_DATE,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map =  Dict(Date(2024) => "blue", Date(2025) => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
                AgStringColumnDef(
                    field_name = "c",
                    header_name = "C",
                    filter = true,
                    default_sort = nothing,
                    width = 500,
                    cell_background = "#111",
                    rect_background = "#222",
                    color = "#333",
                    text_align = AG_LEFT,
                    color_map = Dict("text" => "blue", "txt" => "blue"),
                    threshold = AGThreshold(0; color_up = "#22ab94", color_down = "#f23645"),
                ),
            ],
        )

        @test table == result
    end
end

@testset verbose = true "Server-side model" begin
    @testset "Case №1: Without column_defs" begin
        table = ag_table(
            AGURL("http://0.0.0.0:8000/test_data");
            name = "server_side",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "server_side",
            row_data = AGURL("http://0.0.0.0:8000/test_data"; page_size = 100),
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[]
        )

        @test table == result
    end

    @testset "Case №1: With column_defs" begin
        table = ag_table(
            AGURL("http://0.0.0.0:8000/test_data"),
            ag_define_headers(["col1", "col2", "col3"])...;
            name = "server_side",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "server_side",
            row_data = AGURL("http://0.0.0.0:8000/test_data"; page_size = 100),
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "col1",
                    header_name = "col1",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "col2",
                    header_name = "col2",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "col3",
                    header_name = "col3",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ]
        )

        @test table == result

        table = ag_table(
            AGURL("http://0.0.0.0:8000/test_data"),
            ag_define_headers(["col1", "col2", "col3"])...,
            AgStringColumnDef(
                    field_name = "col1",
                    header_name = "col1",
                    filter = true,
                    default_sort = AG_ASC,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
            );
            name = "server_side",
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
        )

        result = AGTable(
            name = "server_side",
            row_data = AGURL("http://0.0.0.0:8000/test_data"; page_size = 100),
            resize = true,
            flex = true,
            header_height = 50,
            row_height = 50,
            column_filter = true,
            column_defs = AbstractColumnDef[
                AgStringColumnDef(
                    field_name = "col1",
                    header_name = "col1",
                    filter = true,
                    default_sort = AG_ASC,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "col2",
                    header_name = "col2",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
                AgStringColumnDef(
                    field_name = "col3",
                    header_name = "col3",
                    filter = false,
                    default_sort = nothing,
                    width = nothing,
                    cell_background = "#fff",
                    rect_background = "#fff",
                    color = "#000",
                    text_align = AG_LEFT,
                    color_map = Dict{String,String}(),
                    threshold = nothing,
                ),
            ]
        )

        @test table == result
    end
end


@testset verbose = true "Table panel" begin

    struct Foo
        a::Union{Int64,String}
        b::Union{DateTime,String}
        c::String
    end

    values_structs = [
        Foo(1, DateTime(2024), "text"),
        Foo(1, DateTime(2024), "text"),
        Foo(1, DateTime(2024), "text"),
    ]

    string_structs = [
        Foo("1", "2024-01-01", "text"),
        Foo("1", "2024-01-01", "text"),
        Foo("1", "2024-01-01", "text"),
    ]

    mixed_structs = [values_structs; string_structs]

    @testset "Case №1: Single panel" begin
        panel = ag_panel(
            ag_table(values_structs; name = "Single table");
            name = "Single panel",
            bottom = true,
        )

        result = AGPanel(
            name = "Single panel",
            tables = (ag_table(values_structs; name = "Single table"),),
            bottom = true,
            uuid_key = "",
            license_key = "",
        )

        @test panel == result
    end

    @testset "Case №2: Panel with tables" begin
        panel = ag_panel(
            ag_table(values_structs; name = "Values table"),
            ag_table(string_structs; name = "String table"),
            ag_table(mixed_structs; name = "Mixed table");
            name = "Single panel",
            bottom = false,
        )

        result = AGPanel(
            name = "Single panel",
            tables = (
                ag_table(values_structs; name = "Values table"), 
                ag_table(string_structs; name = "String table"),
                ag_table(mixed_structs; name = "Mixed table"),
            ),
            bottom = false,
            uuid_key = "",
            license_key = "",
        )

        @test panel == result
    end
end
