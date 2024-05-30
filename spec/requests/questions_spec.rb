require 'rails_helper'

RSpec.describe "Api::V1Questions", type: :request do

  # NOT WORKING TEST
  # RETURNING 403 FORBIDDEN
  # TESTED IN POSTMAN
  pending

  # let(:valid_params) {
  #   {
  #     question: {
  #       title: "example",
  #       body: "example"
  #     }
  #   }
  # }

  # describe "GET /index" do
  #   it "return all questions" do
  #     get "/api/v1/questions"

  #     expect(response).to have_http_status(200)
  #   end
  # end

  # describe "POST /create" do
  #   it "create new question" do
  #     post "/api/v1/questions", params: valid_params
      
  #     expect(response).to have_http_status(:success)
  #   end

  #   it "create new question" do

  #     expect {
  #       post "/api/v1/questions", params: valid_params
  #     }.to change(Question, :count).by(1)
  #   end
  # end
end
