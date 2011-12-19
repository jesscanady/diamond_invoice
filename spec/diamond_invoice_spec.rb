require 'diamond_invoice'

describe DiamondInvoice do

  # the sample file provided has nine incoming books
  context "when providing a list of new books" do 

    subject { DiamondInvoice.new(File.read('data/diamond_invoice.txt')) }

    it "provides an array of new titles" do 
      subject.new_titles.should == ["day early delivery compliance fund (net)",
      "amazing spider-man #676",
      "animal man #2",
      "anita blake circus damned scoundrel #3 (of 5) (mr)",
      "archie & friends #159",
      "avengers #20",
      "back issue #53 (c: 0-1-1)",
      "baltimore vol 01 the plague ships tp (c: 0-1-2)",
      "batman #1 2nd ptg"] 
    end

    it "ignores anything in the @excluded_titles list" do 
      subject.excluded_titles << "avengers" 
      subject.new_titles.should_not include("avengers #20")
    end
        
  end

end
