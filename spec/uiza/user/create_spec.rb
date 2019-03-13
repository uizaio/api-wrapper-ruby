require "spec_helper"

RSpec.describe Uiza::Callback do
  before(:each) do
    Uiza.app_id = "your-app-id"
    Uiza.authorization = "your-authorization"
  end

  describe "::create" do
    context "API returns code 200" do
      it "should returns an user" do
        params = {
          status: 1,
          username: "user_test002",
          email: "user_test002@uiza.io",
          password: "FMpsr<4[dGPu?B#u",
          gender: 0,
          dob: "05/15/2018",
          avatar: "https://exemple.com/avatar.jpeg",
          fullname: "User Test",
          isAdmin: 0,
          appId: "your-app-id"
        }

        # create user
        expected_method_1 = :post
        expected_url_1 = "https://stag-ap-southeast-1-api.uizadev.io/api/public/v4/admin/user"
        expected_headers_1 = {"Authorization" => "your-authorization"}
        expected_body_1 = params
        mock_response_1 = {
          data: {
            id: "your-user-id",
            status: 1,
            username: "user_test002",
            email: "user_test002@uiza.io",
            password: "FMpsr<4[dGPu?B#u",
            gender: 0,
            dob: "05/15/2018",
            avatar: "https://exemple.com/avatar.jpeg",
            fullname: "User Test",
            isAdmin: 0
          },
          code: 200
        }

        stub_request(expected_method_1, expected_url_1)
          .with(headers: expected_headers_1, body: expected_body_1)
          .to_return(body: mock_response_1.to_json)

        # retrieve user with id = "your-user-id"
        expected_method_2 = :get
        expected_url_2 = "https://stag-ap-southeast-1-api.uizadev.io/api/public/v4/admin/user"
        expected_headers_2 = {"Authorization" => "your-authorization"}
        expected_query_2 = {id: "your-user-id", appId: "your-app-id"}
        mock_response_2 = {
          data: {
            id: "your-callback-id",
            status: 1,
            username: "user_test002",
            email: "user_test002@uiza.io",
            password: "FMpsr<4[dGPu?B#u",
            gender: 0,
            dob: "05/15/2018",
            avatar: "https://exemple.com/avatar.jpeg",
            fullname: "User Test",
            isAdmin: 0
          },
          code: 200
        }

        stub_request(expected_method_2, expected_url_2)
          .with(headers: expected_headers_2, query: expected_query_2)
          .to_return(body: mock_response_2.to_json)

        user = Uiza::User.create params

        expect(user.id).to eq "your-callback-id"
        expect(user.status).to eq 1
        expect(user.username).to eq "user_test002"
        expect(user.email).to eq "user_test002@uiza.io"
        expect(user.password).to eq "FMpsr<4[dGPu?B#u"
        expect(user.gender).to eq 0
        expect(user.dob).to eq "05/15/2018"
        expect(user.avatar).to eq "https://exemple.com/avatar.jpeg"
        expect(user.fullname).to eq "User Test"
        expect(user.isAdmin).to eq 0

        expect(WebMock).to have_requested(expected_method_1, expected_url_1)
          .with(headers: expected_headers_1, body: expected_body_1)

        expect(WebMock).to have_requested(expected_method_2, expected_url_2)
          .with(headers: expected_headers_2, query: expected_query_2)
      end
    end

    context "API returns code 400" do
      it "should raise BadRequestError" do
        api_return_error_code 400, Uiza::Error::BadRequestError
      end
    end

    context "API returns code 401" do
      it "should raise UnauthorizedError" do
        api_return_error_code 401, Uiza::Error::UnauthorizedError
      end
    end

    context "API returns code 404" do
      it "should raise NotFoundError" do
        api_return_error_code 404, Uiza::Error::NotFoundError
      end
    end

    context "API returns code 422" do
      it "should raise UnprocessableError" do
        api_return_error_code 422, Uiza::Error::UnprocessableError
      end
    end

    context "API returns code 500" do
      it "should raise InternalServerError" do
        api_return_error_code 500, Uiza::Error::InternalServerError
      end
    end

    context "API returns code 503" do
      it "should raise ServiceUnavailableError" do
        api_return_error_code 503, Uiza::Error::ServiceUnavailableError
      end
    end

    context "API returns code 4xx (example 456)" do
      it "should raise ClientError" do
        api_return_error_code 456, Uiza::Error::ClientError
      end
    end

    context "API returns code 5xx (example 567)" do
      it "should raise ServerError" do
        api_return_error_code 567, Uiza::Error::ServerError
      end
    end

    context "API returns unknow code (example 345)" do
      it "should raise UizaError" do
        api_return_error_code 345, Uiza::Error::UizaError
      end
    end

    def api_return_error_code error_code, error_class
      params = {
        key: "invalid-value",
        appId: "your-app-id"
      }

      expected_method = :post
      expected_url = "https://stag-ap-southeast-1-api.uizadev.io/api/public/v4/admin/user"
      expected_headers = {"Authorization" => "your-authorization"}
      expected_body = params
      mock_response = {
        code: error_code,
        message: "error message"
      }

      stub_request(expected_method, expected_url)
        .with(headers: expected_headers, body: expected_body)
        .to_return(body: mock_response.to_json)

      expect{Uiza::User.create params}.to raise_error do |error|
        expect(error).to be_a error_class
        expect(error.description_link).to eq "https://docs.uiza.io/#create-an-user"
        expect(error.code).to eq error_code
        expect(error.message).to eq "error message"
      end

      expect(WebMock).to have_requested(expected_method, expected_url)
        .with(headers: expected_headers, body: expected_body)
    end
  end
end
