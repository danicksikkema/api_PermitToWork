module Api
    module V1
        class ProtectionsController < ApplicationController
          def index
            @protections = Protection.order('created_at DESC')
            render json: @protections
          end

          def show
            @protection = Protection.find(params[:id])
            render json: @protection
          end

          def create
            @protection = Protection.new(protection_params)

            if @protection.save
              render json: @protection, status: :created
            else
              render json: @protection.errors, status: :unprocessable_entity
            end
          end

          def update
            @protection = Protection.find(params[:id])

            if @protection.update(protection_params)
              render json: @protection, status: :update
            else
              render json: @protection.errors, status: :unprocessable_entity
            end
          end

          def destroy
            @protection = Protection.find(params[:id])
            if @protection
              @protection.destroy
            else
              render json: {post: "not found"}, status: :not_found
            end
          end

          private

          def protection_params
              params.require(:protections).protections(:name, :permit_id)
          end
        end
    end
end
