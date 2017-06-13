module Api
    module V1
        class PermitsController < ApplicationController
          def index
            @permits = Permit.order('created_at DESC')
            render json: @permits
          end

          def show
            @permit = Permit.find(params[:id])
            render json: @permit
          end

          def create
            @permit = Permit.new(permit_params)
            if @permit.save
              render json: @permit, status: :created
            else
              render json: @permit.errors, status: :unprocessable_entity
            end
          end

          def update
            @permit = Permit.find(params[:id])

            if @permit.update(permit_params)
              render json: @permit, status: :update
            else
              render json: @permit.errors, status: :unprocessable_entity
            end
          end

          def destroy
            @permit = Permit.find(params[:id])
            if @permit
              @permit.destroy
            else
              render json: {post: "not found"}, status: :not_found
            end
          end

          private

          def permit_params
              params.require(:permit).permit(:name, :type, :description)
          end
        end
    end
end
