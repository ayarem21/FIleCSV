require 'csv'

array_csv = CSV.read("acme_worksheet.csv")
table = CSV.parse(File.read("acme_worksheet.csv"), headers: true)
if Date.parse(table[0]["Date"]).mon / 10 == 0
  print(Date.parse(table[0]["Date"]).year, '-0',Date.parse(table[0]["Date"]).mon, '-',Date.parse(table[0]["Date"]).mday)
else
  print(Date.parse(table[0]["Date"]).year, '-',Date.parse(table[0]["Date"]).mon, '-',Date.parse(table[0]["Date"]).mday)
end
