require 'csv'

table = CSV.parse(File.read("csv/acme_worksheet.csv"), headers: true)
# print(table)

# puts (CSV.foreach("csv/acme_worksheet.csv", headers: true) )
# data_file = 'csv/acme_worksheet.csv'
# data = []
# CSV.foreach(data_file, headers: true) do |row|
#   data << row.to_hash
# end
# puts data





not_formatted_data = table["Date"].uniq!#.unshift("Name / Date")
employee_name = table["Employee Name"].uniq!
# print(employee_name)
formatted_data = []
not_formatted_data.each_with_index do |elem, i|
  formatted_data[i] = "#{Date.parse(elem).year}-#{'%02i' % Date.parse(elem).mon}-#{ '%02i' % Date.parse(elem).mday}"
  # puts date_array[i]
end

formatted_data = formatted_data.unshift("Name / Date")
print(formatted_data)
csv_array = ""


# puts table["Date"].count("Jul 05 2020")
index = 0
cnt = 0
tmp_name = []
tmp_date = []
tmp_work = []
write_array = []
new_name_list = []
new_date_list = []
new_work_list = []
not_formatted_data.each do |dt|
  cnt = table["Date"].count(dt)
  index.upto(index + cnt - 1) do |index|
    tmp_name.push(table["Employee Name"][index])
    tmp_date.push(table["Date"][index])
    tmp_work.push(table["Work Hours"][index])
  end
  str = ""
  str2 = ""
  bool = ""
  # puts tmp_name
  puts tmp_work.length
  puts tmp_name.length

  # puts tmp_work.lenght
  puts "#{index} #{index+cnt}"
  employee_name.each_with_index do |e_name, k|
        if tmp_name.include?(e_name)
          str =  e_name  #{tmp} true"
          # str2 = tmp
          bool = 1
        else
          str = e_name #{tmp} false"
          # str2 = tmp
          bool = 0
        end
      # write_array = write_array.unshift("#{e_name}")
    # end

    new_name_list << str
    new_date_list << str2
    new_work_list << bool
  end
  # print tmp_work
  index += cnt
  tmp_date = []
  tmp_name = []
  # print tmp_work
  tmp_work = []
end
# print(new_name_list, " ", new_date_list, " ", new_work_list)
print (new_work_list)
new_hash_data = []

new_name_list.each_with_index do |name, i|
  new_hash_data << {"Employee Name" => name, "Date" => new_date_list[i], "Work Hours" => new_work_list[i]}
end

# work_hash = []
# hour = 0
# new_hash_data.each_with_index do |hd, i|
#   if hd["Work Hours"] > 0
#     hour = table["Work Hours"][i]
#   else
#     hour = 0
#   end
#   work_hash << hour
# end
# puts
# puts
# print(work_hash, " ")
array = []
# puts(new_hash_data)
CSV.open("csv/accounting.csv", "w",
  write_headers: true,
  headers: formatted_data
  ) do |csv|
    employee_name.each do |name|
      array.push(name)
      new_hash_data.each_with_index do |h_name, i|
        if h_name["Work Hours"].to_f > 0
          if h_name["Employee Name"] == name
            array.push(h_name["Work Hours"].to_f)
          end
        else
          if h_name["Employee Name"] == name
            array.push(h_name["Work Hours"].to_f)
          end
        end
      end
      csv << array
      array = []
    end

  end
puts(employee_name.count)
