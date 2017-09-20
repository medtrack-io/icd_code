defmodule IcdCode.ICDCode.Codes_R01 do

	alias IcdCode.ICDCode

	def _R010 do 
		%ICDCode{full_code: "R010",
        		category_code: "R01",
        		short_code: "0",
        		full_name: "Benign and innocent cardiac murmurs",
        		short_name: "Benign and innocent cardiac murmurs",
        		category_name: "Benign and innocent cardiac murmurs"
        		}
	end
	def _R011 do 
		%ICDCode{full_code: "R011",
        		category_code: "R01",
        		short_code: "1",
        		full_name: "Cardiac murmur, unspecified",
        		short_name: "Cardiac murmur, unspecified",
        		category_name: "Cardiac murmur, unspecified"
        		}
	end
	def _R012 do 
		%ICDCode{full_code: "R012",
        		category_code: "R01",
        		short_code: "2",
        		full_name: "Other cardiac sounds",
        		short_name: "Other cardiac sounds",
        		category_name: "Other cardiac sounds"
        		}
	end

end
