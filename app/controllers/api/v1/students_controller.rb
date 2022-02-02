module Api
    module V1
        class StudentsController  < ApplicationController
            def index
                students = Student.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded students', data:students}, status: :ok
            end
            def create
                student = Student.new(student_params)
        
                if student.save
                  render json: {status: 'SUCCESS', message:'Saved student', data:student},status: :ok
                else
                  render json: {status: 'ERROR', message:'Student not saved', data:student.errors},status: :unprocessable_entity
                end
            end      
            def show
                student = Student.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded student', data:student},status: :ok
            end

            def update
                student = Student.find(params[:id])
                if student.update(student_params)
                  render json: {status: 'SUCCESS', message:'Updated student', data:student},status: :ok
                else
                  render json: {status: 'ERROR', message:'student not updated', data:student.errors},status: :unprocessable_entity
                end
            end
            def destroy
                student = Student.find(params[:id])
                student.destroy
                render json: {status: 'SUCCESS', message:'Student deleted', data:student},status: :ok
            end
            private

            def student_params
              params.permit(:name, :email, :contact, :address)
            end


        end
    end
end