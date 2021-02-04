routes do
  namespace '/api/getFoo' do

    get '' do
      content_type :json
      { foo: "Sinatra" }.to_json
    end

    get '/:id' do
      content_type :json
      { id: params[:id] }.to_json
    end

  end

  namespace '/api/setFoo' do

    get '/:id' do
      content_type :json
      { id: params[:id] }.to_json
    end

  end
end
