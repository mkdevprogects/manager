admins = [
    {
        name: 'Admin',
        surname: 'Admin',
        phone: '11111111111',
        email: 'admin.1.@admin.com',
        password: '123123'
    },
    {
        name: 'Admin2',
        surname: 'Admin2',
        phone: '11111111112',
        email: 'admin.2.@admin.com',
        password: '123123'
    }
]

admins.each do |params|
  Admin.create!(params)
end
