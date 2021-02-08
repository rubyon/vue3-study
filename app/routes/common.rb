routes do
  namespace '/api/getCommon' do
    # post '/totalUsersPages' do
    #   result = JSON.parse(request.body.read)
    #   per_page = result['perpage'].to_i
    #   user = User.find_all
    #   page = user.count / per_page
    #   page += 1 if user.count % per_page != 0
    #   MultiJson.dump(result: page)
    # end
    post '/totalUsers' do
      MultiJson.dump(result: User.count)
    end
  end
end
