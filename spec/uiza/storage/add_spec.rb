require "spec_helper"

RSpec.describe Uiza::Storage do
  before(:each) do
    Uiza.app_id = "your-app-id"
    Uiza.authorization = "your-authorization"
  end

  describe "::add" do
    context "API returns code 200" do
      it "should returns an storage" do
        params = {
          name: "FTP Uiza sample test",
          description: "FTP of Uiza, use for transcode",
          storageType: "ftp",
          host: "ftp-example.uiza.io",
          port: 21
        }

        # add storage
        expected_method_1 = :post
        expected_url_1 = "https://stag-ap-southeast-1-api.uizadev.io/api/public/v4/media/storage"
        expected_headers_1 = {"Authorization" => "your-authorization"}
        expected_body_1 = params.merge!(appId: "your-app-id")
        mock_response_1 = {
          data: {
            id: "your-storage-id"
          },
          code: 200
        }

        stub_request(expected_method_1, expected_url_1)
          .with(headers: expected_headers_1, body: expected_body_1)
          .to_return(body: mock_response_1.to_json)

        # retrieve storage with id = "your-storage-id"
        expected_method_2 = :get
        expected_url_2 = "https://stag-ap-southeast-1-api.uizadev.io/api/public/v4/media/storage"
        expected_headers_2 = {"Authorization" => "your-authorization"}
        expected_query_2 = {id: "your-storage-id", appId: "your-app-id"}
        mock_response_2 = {
          data: {
            id: "your-storage-id",
            name: "FTP Uiza sample test",
            description: "FTP of Uiza, use for transcode",
            storageType: "ftp",
            host: "ftp-example.uiza.io",
            port: 21
          },
          code: 200
        }

        stub_request(expected_method_2, expected_url_2)
          .with(headers: expected_headers_2, query: expected_query_2)
          .to_return(body: mock_response_2.to_json)

        storage = Uiza::Storage.add params

        expect(storage.id).to eq "your-storage-id"
        expect(storage.name).to eq "FTP Uiza sample test"
        expect(storage.description).to eq "FTP of Uiza, use for transcode"
        expect(storage.storageType).to eq "ftp"
        expect(storage.host).to eq "ftp-example.uiza.io"
        expect(storage.port).to eq 21

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
        key: "invalid-value"
      }

      expected_method = :post
      expected_url = "https://stag-ap-southeast-1-api.uizadev.io/api/public/v4/media/storage"
      expected_headers = {"Authorization" => "your-authorization"}
      expected_body = params.merge(appId: "your-app-id")
      mock_response = {
        code: error_code,
        message: "error message"
      }

      stub_request(expected_method, expected_url)
        .with(headers: expected_headers, body: expected_body)
        .to_return(body: mock_response.to_json)

      expect{Uiza::Storage.add params}.to raise_error do |error|
        expect(error).to be_a error_class
        expect(error.description_link).to eq "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Storage-create_storage"
        expect(error.code).to eq error_code
        expect(error.message).to eq "error message"
      end

      expect(WebMock).to have_requested(expected_method, expected_url)
        .with(headers: expected_headers, body: expected_body)
    end
  end
end
