routes do
  namespace '/api/getUser' do
    post '' do
      MultiJson.dump(result: User.all.map(&:to_api))
    end

    post '/find' do
      result = JSON.parse(request.body.read)
      user = User.where(name: result['name'], email: result['email'])
      if user.empty?
        status 422
        MultiJson.dump(result: ['nil'])
      else
        status 201
        MultiJson.dump(result: user.all.map(&:to_api))
      end
    end
  end

  namespace '/api/setUser' do
    post '' do
      begin
        user = User.new(json_params)
        if user.save
          status 201
          MultiJson.dump(result: 'ok')
        else
          status 422
          MultiJson.dump(result: 'fail')
        end
      rescue StandardError
        status 422
        MultiJson.dump(result: 'Invalid JSON')
      end
    end
  end
end
