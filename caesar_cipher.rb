#Pseudocode
#Convert string into an array
#For every item do 
# Shift letter by X to the right
  #Take every letter
  #Compare it with alphabet-digit hash
    #Convert it do digits
    #If its symbol skip
    #Raise digit by X
  #[Some logic to avoid after-z-wrap here?]
    #Try substract z-number if digit > z-number
  #Compare it with alphabet-digit hash
    #Convert it back to the string.
    #If its symbol skip
    #Push result to array
#Join new array to the string again
#Capitalize
#Return new string.

def caesar_cipher(str, shift)

  alpha_down = "abcdefghijklmnopqrstuvwxyz"
  alpha_array = alpha_down.split("")
  
  i = 1
  alphacode = {}
  alpha_array.each do |letter|
    alphacode[i] = letter
    i += 1
  end

  str_array = str.downcase.split("")
  coded_array = []
  str_array.each do |letter|
    if letter.match /[a-z]/
      alphacode.each do |key, value|
        if value == letter
          coded_array << (key + shift)
        end
      end
    else
      coded_array << letter
    end
  end
  #With case-method in hope of more readability

  #peak is 26 symbol "z"
  coded_str = nil
  proxy_array = []
  coded_array.each do |code|
    if code.to_s.match /[^0-9]/
      proxy_array << code
    else
      alphacode.each do |key, value|
        if code <= 26 && code == key
          proxy_array << value
        elsif code > 26
          code = code - 26
          if code == key
            proxy_array << value
          end
        end
      end
    end
  end
  coded_str = proxy_array.join.capitalize
  p coded_str
end