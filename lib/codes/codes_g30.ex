defmodule IcdCode.ICDCode.Codes_G30 do

	alias IcdCode.ICDCode

	def _G300 do 
		%ICDCode{full_code: "G300",
        		category_code: "G30",
        		short_code: "0",
        		full_name: "Alzheimer's disease with early onset",
        		short_name: "Alzheimer's disease with early onset",
        		category_name: "Alzheimer's disease with early onset"
        		}
	end
	def _G301 do 
		%ICDCode{full_code: "G301",
        		category_code: "G30",
        		short_code: "1",
        		full_name: "Alzheimer's disease with late onset",
        		short_name: "Alzheimer's disease with late onset",
        		category_name: "Alzheimer's disease with late onset"
        		}
	end
	def _G308 do 
		%ICDCode{full_code: "G308",
        		category_code: "G30",
        		short_code: "8",
        		full_name: "Other Alzheimer's disease",
        		short_name: "Other Alzheimer's disease",
        		category_name: "Other Alzheimer's disease"
        		}
	end
	def _G309 do 
		%ICDCode{full_code: "G309",
        		category_code: "G30",
        		short_code: "9",
        		full_name: "Alzheimer's disease, unspecified",
        		short_name: "Alzheimer's disease, unspecified",
        		category_name: "Alzheimer's disease, unspecified"
        		}
	end

end
