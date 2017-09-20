defmodule IcdCode.ICDCode.Codes_R60 do

	alias IcdCode.ICDCode

	def _R600 do 
		%ICDCode{full_code: "R600",
        		category_code: "R60",
        		short_code: "0",
        		full_name: "Localized edema",
        		short_name: "Localized edema",
        		category_name: "Localized edema"
        		}
	end
	def _R601 do 
		%ICDCode{full_code: "R601",
        		category_code: "R60",
        		short_code: "1",
        		full_name: "Generalized edema",
        		short_name: "Generalized edema",
        		category_name: "Generalized edema"
        		}
	end
	def _R609 do 
		%ICDCode{full_code: "R609",
        		category_code: "R60",
        		short_code: "9",
        		full_name: "Edema, unspecified",
        		short_name: "Edema, unspecified",
        		category_name: "Edema, unspecified"
        		}
	end

end
