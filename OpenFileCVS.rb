require 'csv'

table = CSV.parse(File.read("csv/acme_worksheet.csv"), headers: true)

temp_array = table["Date"].uniq!#.unshift("Name / Date")
# print(temp_array)
date_array = []
temp_array.each_with_index do |elem, i|
  date_array[i] = "#{Date.parse(elem).year}-#{'%02i' % Date.parse(elem).mon}-#{ '%02i' % Date.parse(elem).mday}"
  # puts date_array[i]
end
date_array = date_array.unshift("Name / Date")
print(date_array)
CSV.open("csv/accounting.csv", "w",
  write_headers: true,
  headers: date_array
  ) do |csv|
end
