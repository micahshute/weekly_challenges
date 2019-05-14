# Write a method which accepts an array of integers. 
# Loop through the input array with a while loop and 
# replace all even numbers with the string "REDACTED"

def redact_evens(arr)
    i = 0
    while i < arr.length
        arr[i] = "REDACTED" if arr[i].even?
        i += 1
    end
    arr
end

arr = [1,2,3,4,5]
puts redact_evens(arr).to_s