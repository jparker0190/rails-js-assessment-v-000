class AssignmentsController < ApplicationController
 before_action :set_assignment, only: [:show, :edit, :update, :destroy]

 # GET /assignments
 def index
    @portfolios = current_user.portfolios.includes(:stocks).all
    @assignments = Assignment.all
 end

 # GET /assignments/1
 def show
  
 end

 # GET /assignments/new
 def new
   @assignment = Assignment.new(portfolio_id: params[:portfolio_id])
   @stock = Assignment.new_from_lookup(params[:ticker])
    
 end

 # GET /assignments/1/edit
 def edit
 end

 def create
   @assignment = Assignment.create(assignment_params)
   @stock = Assignment.new_from_lookup(params[:ticker])
   respond_to do |format|
    if @assignment.save
      format.html { redirect_to @assignment, notice: 'Trade was successfully placed.' }
      format.json { render :show, status: :created, location: @assignment }
    else
      format.html { render :new }
      format.json { render json: @assignment.errors, status: :unprocessable_entity }
    end
  end
 end
 
 # PATCH/PUT /assignments/1
 # PATCH/PUT /assignments/1.json
 def update
   respond_to do |format|
     if @assignment.update(assignment_params)
       format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
       format.json { render :show, status: :ok, location: @assignment }
     else
       format.html { render :edit }
       format.json { render json: @assignment.errors, status: :unprocessable_entity }
     end
   end
 end

 # DELETE /assignments/1
 def destroy
   @assignment.destroy
   respond_to do |format|
     format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
     format.json { head :no_content }
   end
 end

 private
   def set_assignment
     @assignment = Assignment.find(params[:id])
   end

 
   def assignment_params
     params.require(:assignment).permit(:direction,:ticker,:shares,:stock_id, :portfolio_id)
   end
end
