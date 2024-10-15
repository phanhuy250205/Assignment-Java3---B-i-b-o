package model;



public class CATEGORIES {
	private String Id ;
	private String Name;
	public CATEGORIES() {
		
	}
	public CATEGORIES(String id, String name) {
		
		Id = id;
		Name = name;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	@Override
	public String toString() {
		return "CATEGORIES [Id=" + Id + ", Name=" + Name + "]";
	}
	
	
	
}
