module Api
    module V1
        class PrecautionsController < ApplicationController
          def index
            @precautions = Precaution.order('created_at DESC')
            render json: @precautions
          end

          def show
            @precaution = Precaution.find(params[:id])
            render json: @precaution
          end

          def create
            @precaution = Precaution.new(precaution_params)
            if @precaution.save
              render json: @precaution, status: :created
            else
              render json: @precaution.errors, status: :unprocessable_entity
            end
          end

          def update
            @precaution = Precaution.find(params[:id])

            if @precaution.update(precaution_params)
              render json: @precaution, status: :update
            else
              render json: @precaution.errors, status: :unprocessable_entity
            end
          end

          def destroy
            @precaution = Precaution.find(params[:id])
            if @precaution
              @precaution.destroy
            else
              render json: {post: "not found"}, status: :not_found
            end
          end

          private

          def precaution_params
              params.require(:precaution).precaution(:name)
          end
        end
    end
end
