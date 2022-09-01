#defining dict
my_dict = {"name": "chanan", "age": 27, 100: 80}
# print(my_dict)
# print(my_dict["name"])
my_dict["name"] = "chanan jacobs"
# print(my_dict)
my_dict["phone"] = 545286496
# print(my_dict)


my_dict = {"name": "moshe", "age": 27}
# print(my_dict)
my_dict["new_dict"] = {}
# print(my_dict)
print(my_dict["new_dict"])
my_dict["new_dict"]["new_name"] = "yossi"
# print(my_dict)
my_dict["parents"] = ["moshe", "ora"]
# print(my_dict)
my_dict["parents"].append("yossi")
# print(my_dict)

#print keys of dict
# print("-"* 10)
# print all keys
for key in my_dict:
    print(key)
# same same
for key in my_dict.keys():
    print(key)
#
# print('-'*10)
# run over values
for val in my_dict.values():
    print(val)


# key in my_dict -> True if the key in this dict
# key in my_dict -> False if the key not in this dict
# print('-'*10)
if "name" in my_dict:
    print(my_dict['name'])
#

if 'chanan' in my_dict:
    print('yes')
else:
    print('no')

# check if value in this dict
print(my_dict.values())
if 'yoni' in my_dict.values():
    print("yes i have this value")
if 'age' in my_dict:
    print('yes')
    print(my_dict["age"])
else:
    print('no')

# letter_dict["a"] = 0
# print(letter_dict)
# letter_dict["a"] = letter_dict["a"] + 1
# print(letter_dict)
# letter_dict["a"] = letter_dict["a"] + 1
# print(letter_dict)

#print the count of every letter
# string = "aaabbffffggggggggccwwababa"
# letter_dict = {}
# for letter in string:
#     if letter not in letter_dict:
#         letter_dict[letter] = 1
#     else:
#         letter_dict[letter] = letter_dict[letter] + 1
# print(letter_dict)


string = "amir katz\nyossi cohen\nhadar levi\nmatan ohana"
# print(string)
list_names = string.split('\n')
print(list_names)
my_last_name_dict = {}
count = 0
for full_name in list_names:
    # count += 1
    list_full_name = full_name.split(" ")
    print(list_full_name)
    print(list_full_name[1])
    print(count, 'before', my_last_name_dict)
    if list_full_name[1] not in my_last_name_dict:
        my_last_name_dict[list_full_name[1]] = 1
    else:
        my_last_name_dict[list_full_name[1]] += 1
        my_last_name_dict[list_full_name[1]] = my_last_name_dict[list_full_name[1]] + 1
    print(count, 'after', my_last_name_dict)


