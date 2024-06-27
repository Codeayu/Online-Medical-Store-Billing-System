package com.ayush.javafiles;
public class Product {
	  private String id;
	  private String name;
//	  private String ;
	  private double mrp;
	  private double sellprice;
	  public Product(String id, String name, double mrp, double sellprice) {
	    this.id = id;
	    this.name = name;
//	    this.description = description;
	    this.mrp = mrp;
	    this.sellprice= sellprice;
	  }

	  public String getId() {
	    return id;
	  }

	  public String getName() {
	    return name;
	  }

//	  public String getDescription() {
//	    return description;
//	  }

	  public double getMrp() {
	    return mrp;
	  }

	public double getSellprice() {
		return sellprice;
	}
	}
