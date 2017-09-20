defmodule IcdCode.ICDCode do

  defstruct [
    full_code: nil,
    category_code: nil,
    short_code: nil,
    full_name: nil,
    category_name: nil,
    short_name: nil
  ]

  def generate_codes(lines \\ 100) do

    path = [:code.priv_dir(:icd_code),"lib","codes"] |> Path.join()
    File.rm_rf(path)
    File.mkdir(path)

    ##IO.write(out, "defmodule MedsteckDb.Models.ICDCode.Codes do \n\talias MedsteckDb.Models.ICDCode\n\n")
    file = [:code.priv_dir(:icd_code), "icd10.txt"] |> Path.join()
    file
    |> File.stream!()
    |> Stream.map(&String.strip/1)
    |> Stream.map(fn line -> {String.split(line)|>List.first() |> String.trim(), line}  end)
    #|> Enum.take(lines)
    |> Enum.each(fn {code, line} ->
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


      full_name = line |> String.slice(String.length(code)..String.length(line)) |> String.lstrip()


      full_code = code

      short_code = code |> String.slice(3..String.length(code))

      funtion = [
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
      |>Enum.join("")
      IO.write(out, funtion)

      File.close(out)
    end)

    #IO.write(out, "end")
    File.ls!(path)
    |> Enum.filter(fn file -> file |>String.ends_with?(".ex")  end)
    |> Enum.each(fn file ->
      f = File.open!([path, file]|>Path.join(), [:append])
      IO.write(f, "\nend\n")
      File.close(f)
    end)

  end

end
