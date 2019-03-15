require "spec_helper"

RSpec.describe Uiza::Live do
  before(:each) do
    Uiza.app_id = "your-app-id"
    Uiza.authorization = "your-authorization"
  end

  describe "::stop_feed" do
    context "API returns code 200" do
      it "should returns a live" do
        id = "your-live-id"

        # stop a live feed
        expected_method = :put
        expected_url = "https://stag-ap-southeast-1-api.uizadev.io/api/public/v4/live/entity/feed"
        expected_headers = {"Authorization" => "your-authorization"}
        expected_body = {id: id, appId: "your-app-id"}
        mock_response = {
          data: {
            entityId: "your-live-id"
          },
          code: 200
        }

        stub_request(expected_method, expected_url)
          .with(headers: expected_headers, body: expected_body)
          .to_return(body: mock_response.to_json)

        response = Uiza::Live.stop_feed id

        expect(response.entityId).to eq "your-live-id"

        expect(WebMock).to have_requested(expected_method, expected_url)
          .with(headers: expected_headers, body: expected_body)
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
      id = "invalid-value"

      expected_method = :put
      expected_url = "https://stag-ap-southeast-1-api.uizadev.io/api/public/v4/live/entity/feed"
      expected_headers = {"Authorization" => "your-authorization"}
      expected_body = {id: id, appId: "your-app-id"}
      mock_response = {
        code: error_code,
        message: "error message"
      }

      stub_request(expected_method, expected_url)
        .with(headers: expected_headers, body: expected_body)
        .to_return(body: mock_response.to_json)

      expect{Uiza::Live.stop_feed id}.to raise_error do |error|
        expect(error).to be_a error_class
        expect(error.description_link).to eq "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Live_Feed-put_live_feed_stop"
        expect(error.code).to eq error_code
        expect(error.message).to eq "error message"
      end

      expect(WebMock).to have_requested(expected_method, expected_url)
        .with(headers: expected_headers, body: expected_body)
    end
  end
end
