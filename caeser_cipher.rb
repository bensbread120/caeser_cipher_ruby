def caeser_cipher(word, shift)
    alphabet = "abcdefghijklmnopqrstuvwyxz"
    capital_alphabet = "ABCDEFGHIJKLMNOPQRSTUVWYXZ"
    new_string = ""
    word.each_char do |letter|
        #find whether letter is upcase, downcase or other
        if alphabet.include?(letter) or capital_alphabet.include?(letter)
            (letter == letter.upcase)? (new_string+=change_upcase(letter, shift, capital_alphabet)) : (new_string+=change_downcase(letter, shift, alphabet))     
        else
            new_string+=letter
        end       
    end
    puts new_string
end

#If upcase save new index and check if it is outside of the alphabets range
def change_upcase(letter, shift, capital_alphabet)
    
    new_letter_index = capital_alphabet.index(letter)+shift
    
    return capital_alphabet[absolute_index(new_letter_index)]
end

#If downcase save new index and check if it is outside of the alphabets range
def change_downcase(letter, shift, alphabet)
    
    new_letter_index = alphabet.index(letter)+shift
    
    return alphabet[absolute_index(new_letter_index)]
end

#checks for integers outside of the range and loops until in range either alphabet 
def absolute_index(index)
    (index>0)? 
    ((index > 25)? absolute_index(index-=26): index) : 
    ((index < -26)? absolute_index(index+=26): index)
    
end



#caeser_cipher("ab dkpoLc de??r!", -790)

caeser_cipher("Hey there thanks for looking at my code ", 300) #=> Vsl hvsfs hvobxg tcf zccxwbu oh al qcrs 
caeser_cipher("I hope you enjoy theis example", -50) #=> K jqrg zqw gplqz vjgku gacorng