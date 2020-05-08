class PhotosController < ApplicationController
    def index
        @response = '結果はここに反映されます。'
    end

    def extraction
        # Imports the Google Cloud client library
        require "google/cloud/vision"

        # ファイル取得
        file = params[:file]

        if file != nil && ["image/png", "image/PNG", "image/jpg", "image/JPG", "image/jpeg", "image/JPEG"].include?(file.content_type)
            # Instantiates a client
            image_annotator = Google::Cloud::Vision::ImageAnnotator.new

            # ファイルパス
            file_name = file.tempfile

            # Performs label detection on the image file
            response = image_annotator.text_detection image: file_name

            # textareaに出力
            @response = response.responses[0].text_annotations[0].description
        else
            # 最低限どのエラー処理
            redirect_to '/', alert: '正しいファイルを送信してください。'
            return
        end

        render action: :index
    end
end
