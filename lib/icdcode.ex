defmodule IcdCode.ICDCode do

  defstruct [
    full_code: nil,
    category_code: nil,
    short_code: nil,
    full_name: nil,
    category_name: nil,
    short_name: nil
  ]

  @doc """
  Generates icd 10 modules from icd 10 txt file
  Modules are generated based on icd 10 categories.
  Each module contains all the applicable icd 10 codes under 
  that category
  """
  def generate_codes() do

    path = [:code.priv_dir(:icd_code),"lib","codes"] |> Path.join()
    File.rm_rf(path)
    File.mkdir(path)    
    
    file = [:code.priv_dir(:icd_code), "icd10.txt"] |> Path.join()

    codes = 
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(fn line -> {String.split(line)|>List.first() |> String.trim(), line}  end)
    #|> Enum.take(lines)
    |> Stream.map(fn {code, line} ->
      #A0102   Typhoid fever with heart involvement

      category_code = code |> String.slice(0..2) # take first 3
      cat_file = [path, "codes_#{category_code|>String.downcase()}.ex"]|> Path.join()
      out =
      case File.exists?(cat_file) do
        true ->
          File.open!(cat_file, [:append])
        _ ->

          f = File.open!(cat_file, [:write])
          IO.write(f, "defmodule IcdCode.ICDCode.Codes_#{category_code} do
\n\talias IcdCode.ICDCode\n\n")
          f
      end

      function = get_code_definition(line, code)
      |>Enum.join("")
      IO.write(out, function)

      File.close(out)
      {code, line}
    end)
    |> Stream.map( fn {code, _line} ->  code end)
    |> Enum.uniq()
    

    #IO.write(out, "end")
    File.ls!(path)
    |> Enum.filter(fn file -> file |>String.ends_with?(".ex")  end)
    |> Enum.each(fn file ->
      f = File.open!([path, file]|>Path.join(), [:append])
      IO.write(f, "\nend\n")
      File.close(f)
    end)

    all_module_file_path = Path.join([path, "all_codes.ex"])
    f = File.open!(all_module_file_path, [:write])

    IO.write(f, "defmodule IcdCode.ICDCode.Codes do\n\n")
    
    IO.write(f, "\tdef all_codes do\n")
    IO.write(f, "\t\t [\n")
    Enum.each(codes, fn code -> 
      IO.write(f, "\t\t\t \"#{code}\",\n")
    end)
    IO.write(f, "\t\t ]\n")
    IO.write(f, "\tend\n\n")

    IO.write(f, "\tdef all_categories do\n")
    IO.write(f, "\t\t [\n")
    Enum.map(codes, fn code -> 
      String.slice(code, 0..2)
    end)
    |> Enum.uniq()
    |> Enum.each(fn code -> 
      IO.write(f, "\t\t\t \"#{code}\",\n")
    end)
    IO.write(f, "\t\t ]\n")
    IO.write(f, "\tend\n")

    IO.write(f, "end\n")


    File.close(f)

  end

  def get_code_definition(line, code) do

      full_name = line |> String.slice(String.length(code)..String.length(line)) |> String.trim_leading()      
      short_code = code |> String.slice(3..String.length(code))
      category_code = code |> String.slice(0..2) # take first 3
       [
        "\tdef _#{code} do \n",
        "\t\t%ICDCode{full_code: \"#{code}\",
        \t\tcategory_code: \"#{category_code}\",
        \t\tshort_code: \"#{short_code}\",
        \t\tfull_name: \"#{full_name}\",
        \t\tshort_name: \"#{full_name}\",
        \t\tcategory_name: \"#{full_name}\"
        \t\t}",
      "\n\tend\n"
      ]
  end

end
