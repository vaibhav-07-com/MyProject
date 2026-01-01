package model;

public class maintenance {
    private int id;
    private int memberId;
    private String month;
    private int year;
   	private double amount;
    private String status;
    private String dueDate;
    private String paidDate;
    public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getPaidDate() {
		return paidDate;
	}

	public void setPaidDate(String paidDate) {
		this.paidDate = paidDate;
	}

	private String remarks;

    // Getter and Setter methods
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    @Override
	public String toString() {
		return "maintenance [id=" + id + ", memberId=" + memberId + ", month=" + month + ", year=" + year + ", amount="
				+ amount + ", status=" + status + ", dueDate=" + dueDate + ", paidDate=" + paidDate + ", remarks="
				+ remarks + "]";
	}
   
}
