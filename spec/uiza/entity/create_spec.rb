require "spec_helper"

RSpec.describe Uiza::Entity do
  before(:each) do
    Uiza.app_id = "your-app-id"
    Uiza.authorization = "your-authorization"
  end

  describe "::create" do
    context "API returns code 200" do
      it "should returns an entity" do
        params = {
          name: "The Evolution of Dance",
          url: "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4",
          inputType: "http",
          description: "Judson Laipply did a fantastic job in performing various dance moves",
          shortDescription: "How good a dancer can you be?",
          poster: "https://sample-videos.com/img/Sample-jpg-image-200kb.jpg",
          thumbnail: "https://sample-videos.com/img/Sample-jpg-image-200kb.jpg",
          extendMetadata: {
            movie_category: "action",
            imdb_score: 8.8,
            published_year: "2018"
          },
          embedMetadata: {
            artist: "John Doe",
            album: "Album sample",
            genre: "Pop"
          },
          metadataIds: [
          	"3217b908-15ec-4ed7-a30d-f1072f1ebef6", "2ac7e44c-1c25-42f0-aeb8-3d7e57172a1e"
          ]
        }

        # create entity
        expected_method_1 = :post
        expected_url_1 = "https://ap-southeast-1-api.uiza.co/api/public/v4/media/entity"
        expected_headers_1 = {"Authorization" => "your-authorization"}
        expected_body_1 = params.merge!(appId: "your-app-id")
        mock_response_1 = {
          data: {
            id: "your-entity-id"
          },
          code: 200
        }

        stub_request(expected_method_1, expected_url_1)
          .with(headers: expected_headers_1, body: expected_body_1)
          .to_return(body: mock_response_1.to_json)

        # retrieve entity with id = "your-entity-id"
        expected_method_2 = :get
        expected_url_2 = "https://ap-southeast-1-api.uiza.co/api/public/v4/media/entity"
        expected_headers_2 = {"Authorization" => "your-authorization"}
        expected_query_2 = {id: "your-entity-id", appId: "your-app-id"}
        mock_response_2 = {
          data: {
            id: "your-entity-id",
            appId: "your-app-id",
            name: "The Evolution of Dance",
            description: "Judson Laipply did a fantastic job in performing various dance moves",
            shortDescription: "How good a dancer can you be?",
            inputType: "http",
            url: "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4",
            view: 0,
            poster: "https://sample-videos.com/img/Sample-jpg-image-200kb.jpg",
            thumbnail: "https://sample-videos.com/img/Sample-jpg-image-200kb.jpg",
            type: "vod",
            status: 1,
            embedMetadata: {
              artist: "John Doe",
              album: "Album sample",
              genre: "Pop"
            },
            extendMetadata: {
              movie_category: "action",
              imdb_score: 8.8,
              published_year: "2018"
            }
          },
          version: 4,
          datetime: "2019-03-29T01:31:53.641Z",
          policy: "public",
          requestId: "79ba7199-a1a1-4997-a87b-753ea0199935",
          serviceName: "api-v4",
          message: "OK",
          code: 200,
          type: "SUCCESS"
        }

        stub_request(expected_method_2, expected_url_2)
          .with(headers: expected_headers_2, query: expected_query_2)
          .to_return(body: mock_response_2.to_json)

        entity = Uiza::Entity.create params

        expect(entity.id).to eq "your-entity-id"
        expect(entity.name).to eq "The Evolution of Dance"
        expect(entity.description).to eq "Judson Laipply did a fantastic job in performing various dance moves"
        expect(entity.shortDescription).to eq "How good a dancer can you be?"
        expect(entity.inputType).to eq "http"
        expect(entity.url).to eq "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4"
        expect(entity.view).to eq 0
        expect(entity.poster).to eq "https://sample-videos.com/img/Sample-jpg-image-200kb.jpg"
        expect(entity.thumbnail).to eq "https://sample-videos.com/img/Sample-jpg-image-200kb.jpg"
        expect(entity.type).to eq "vod"
        expect(entity.status).to eq 1
        expect(entity.embedMetadata.artist).to eq "John Doe"
        expect(entity.embedMetadata.album).to eq "Album sample"
        expect(entity.embedMetadata.genre).to eq "Pop"
        expect(entity.extendMetadata.movie_category).to eq "action"
        expect(entity.extendMetadata.imdb_score).to eq 8.8
        expect(entity.extendMetadata.published_year).to eq "2018"

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
      expected_url = "https://ap-southeast-1-api.uiza.co/api/public/v4/media/entity"
      expected_headers = {"Authorization" => "your-authorization"}
      expected_body = params.merge(appId: "your-app-id")
      mock_response = {
        code: error_code,
        message: "error message"
      }

      stub_request(expected_method, expected_url)
        .with(headers: expected_headers, body: expected_body)
        .to_return(body: mock_response.to_json)

      expect{Uiza::Entity.create params}.to raise_error do |error|
        expect(error).to be_a error_class
        expect(error.description_link).to eq "https://docs.uiza.io/v4/#create-entity"
        expect(error.code).to eq error_code
        expect(error.message).to eq "error message"
      end

      expect(WebMock).to have_requested(expected_method, expected_url)
        .with(headers: expected_headers, body: expected_body)
    end
  end
end
