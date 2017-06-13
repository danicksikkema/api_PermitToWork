module Api
    module V1
        class EnvironmentsController < ApplicationController
          def index
            @environments = Environment.order('created_at DESC')
            render json: @environments
          end

          def show
            @environment = Environment.find(params[:id])
            render json: @environment
          end

          def create
            @environment = Environment.new(environment_params)
            @environment.permit_id = params[:permit_id]

            if @environment.save
              render json: @environment, status: :created
            else
              render json: @environment.errors, status: :unprocessable_entity
            end
          end

          def update
            @environment = Environment.find(params[:id])

            if @environment.update(environment_params)
              render json: @environment, status: :update
            else
              render json: @environment.errors, status: :unprocessable_entity
            end
          end

          def destroy
            @environment = Environment.find(params[:id])
            if @environment
              @environment.destroy
            else
              render json: {post: "not found"}, status: :not_found
            end
          end

          private

          def environment_params
              params.require(:environment).environment(:name)
          end
        end
    end
end
