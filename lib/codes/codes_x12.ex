defmodule IcdCode.ICDCode.Codes_X12 do

	alias IcdCode.ICDCode

	def _X12XXXA do 
		%ICDCode{full_code: "X12XXXA",
        		category_code: "X12",
        		short_code: "XXXA",
        		full_name: "Contact with other hot fluids, initial encounter",
        		short_name: "Contact with other hot fluids, initial encounter",
        		category_name: "Contact with other hot fluids, initial encounter"
        		}
	end
	def _X12XXXD do 
		%ICDCode{full_code: "X12XXXD",
        		category_code: "X12",
        		short_code: "XXXD",
        		full_name: "Contact with other hot fluids, subsequent encounter",
        		short_name: "Contact with other hot fluids, subsequent encounter",
        		category_name: "Contact with other hot fluids, subsequent encounter"
        		}
	end
	def _X12XXXS do 
		%ICDCode{full_code: "X12XXXS",
        		category_code: "X12",
        		short_code: "XXXS",
        		full_name: "Contact with other hot fluids, sequela",
        		short_name: "Contact with other hot fluids, sequela",
        		category_name: "Contact with other hot fluids, sequela"
        		}
	end

end
