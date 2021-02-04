routes do
  namespace '/api/getBar' do

    get '' do
      content_type :json
      { bar: "Vue.js" }.to_json
    end

    get '/:id' do
      content_type :json
      { id: params[:id] }.to_json
    end

  end

  namespace '/api/setBar' do

    get '/:id' do
      content_type :json
      { id: params[:id] }.to_json
    end

  end
end
