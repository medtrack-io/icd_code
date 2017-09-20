defmodule IcdCodeTest do
  use ExUnit.Case
  doctest IcdCode

  test "get A000" do
    code = "A000"
    icd_code =IcdCode.get(code)
    assert icd_code.full_code == code
    assert icd_code.full_name == "Cholera due to Vibrio cholerae 01, biovar cholerae"

  end


end
