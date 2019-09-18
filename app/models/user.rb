class User < ApplicationRecord

    def self.import(path)
        list =[]
        CSV.foreach(path, headers: true) do |row|
            list << {
                name: row["name"],
                age: row["age"],
                address: row["address"]
            }

end
        puts "インポートを開始します。"

        User.create!(list)
        puts "結果：成功しました!!"
    rescue  ActiveModel::UnknownAttributeError => invalid
        puts "インポートに失敗しました:#{invalid}"


    end

end

#ベース
# class User < ApplicationRecord
#
#   def self.import(path)
#     CSV.foreach(path, headers: true) do |row|
#       User.create(
#         name: row["name"],
#         age: row["age"],
#         address: row["address"]
#       )
#     end
#   end
# end
