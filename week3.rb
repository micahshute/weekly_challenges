# Write a method which accepts a hash. 
# Make an empty hash inside the method
# Loop over the keys of the input hash using a while loop, and use them to 
# define key-value pairs in the new empty hash. The 
# key-values should be identical unless there is a key 
# :secret, in which case the value should be "REDACTED" instead
# of the original value

#EXAMPLE
# {name: "Micah", secret: "Avengers Spoilers"} should return
# {name: "Micah", secret: "REDACTED"}

def redact_secret(hash)
    keys = hash.keys
    dup_hash = {}
    i = 0
    while i < keys.length
        dup_hash[keys[i]] = keys[i] == :secret ? "REDACTED" : hash[keys[i]]
        i += 1
    end
    dup_hash
end

test_hash = {name: "Micah", secret: "Avengers Spoilers"}

puts redact_secret(test_hash)