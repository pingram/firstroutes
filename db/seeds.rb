bob = User.create!(name: 'Bobby Tables', username: 'btables', email: 'tableboy@tables.drop')
ned = User.create!(name: 'Ned', username: 'nruggeri', email: 'ned@cats.net')

buck_c = Contact.create!(name: 'Buck', email: 'buckminster@fuller.com', user_id: ned.id)
unicorn_c = Contact.create!(name: 'my little pony', email: 'girlsloveme@uni.com',
 user_id: ned.id, is_favorite: true)

cs1 = ContactShare.create!(contact_id: buck_c.id, user_id: bob.id)

com1 = ned.comments.create!(body: 'I love talking!!!')

larp = ContactGroup.create!(name: "LARPers", user_id: ned.id)

ContactGroupContact.create!(contact_id: unicorn_c.id, contact_group_id: larp.id)