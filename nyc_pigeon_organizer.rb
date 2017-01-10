def nyc_pigeon_organizer(data)
  attribute_symbol_array=[]
  complete_names_list=[]
  final_keys=[]
  final_sub_keys=[]
  final_pigeon_list={}
  data.each do |three_chararcteristics,hash_of_attributes_to_names|
    final_sub_keys<<three_chararcteristics
    hash_of_attributes_to_names.each do |attribute,names_array|
      names_array.each do |name|
        complete_names_list<<name
        attribute_symbol_array<<attribute
      end
    end
  end
  attribute_symbol_array=attribute_symbol_array.uniq
  final_keys=complete_names_list.uniq
  #final_keys works, final_sub_keys works
  for i in (0...final_keys.count)
    final_pigeon_list[final_keys[i]]={}
    for j in (0...final_sub_keys.count)
      final_pigeon_list[final_keys[i]][final_sub_keys[j]]=[]
    end
  end
  final_keys.each do |pigeon|
    for k in (0...final_sub_keys.count)
      for l in (0...attribute_symbol_array.count)
        if data[final_sub_keys[k]][attribute_symbol_array[l]]
          if data[final_sub_keys[k]][attribute_symbol_array[l]].include?(pigeon)
            final_pigeon_list[pigeon][final_sub_keys[k]]<<attribute_symbol_array[l].to_s
          end
        end
      end
    end
  end
  final_pigeon_list
end
