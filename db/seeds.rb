# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tag_types = TagType.create([{name: 'Instituicao', key: 'institute'}, {name: 'Materia', key: 'theme'}])

tags = Tag.create([{name: 'Matematica', tag_type_id: tag_types.second.id} , {name: 'Fisica', tag_type_id: tag_types.second.id}, { name: 'Portugues', tag_type_id: tag_types.second.id }, {name: 'ITA', tag_type_id: tag_types.first.id}, {name: 'IME', tag_type_id: tag_types.first.id}, {name: 'USP', tag_type_id: tag_types.first.id}, {name: 'Eletronica', tag_type_id: tag_types.second.id}])

groups = Group.create([{name: 'ita matematica'}, {name: 'usp medicina'}, {name: 'ele 72'}])
puts groups.class

groups_tags = GroupTags.create([{group_id: groups.first.id, tag_id: tags.first.id}, {group_id: groups.first.id, tag_id: tags[3].id}])
