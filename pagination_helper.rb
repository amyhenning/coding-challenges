# TODO: complete this class

class PaginationHelper
  attr_reader :collection
  attr_reader :items_per_page
  # The constructor takes in an array of items and a integer indicating how many
  # items fit within a single page
  def initialize(collection, items_per_page)
    @collection = collection
    @items_per_page = items_per_page
  end
  
  # returns the number of items within the entire collection
  def item_count
    collection.length
  end
  
  # returns the number of pages
  def page_count
    (item_count.to_f / items_per_page.to_f).ceil
  end
  
  # returns the number of items on the current page. page_index is zero based.
  # this method should return -1 for page_index values that are out of range
  def page_item_count(page_index)
    # identify which index to start on using the page_index argument
    collection_index = items_per_page * page_index
    # if the page_count argument is larger than the number of pages, return -1
    if page_index >= page_count
      return -1
    # if adding collection_index and the items_per_page is larger than than # of items,
    # return the number of items from the collection_index to the end of the collection
    elsif collection_index + items_per_page >= item_count
      return (collection[collection_index]..collection.last).count
    # if adding collection_index and items_per_page is less than the total # of items,
    # just return items_per_page
    elsif collection_index + items_per_page < item_count
      return items_per_page #(collection[collection_index..(collection_index+items_per_page)-1]).count
    end
  end
  
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

  # determines what page an item is on. Zero based indexes.
  # this method should return -1 for item_index values that are out of range
  def page_index(item_index)
    # page 0: [0, 1, 2, 3]
    # if the collection is empty, return negative 1
    if collection.empty?
      return -1
    # if the item_index is between 0 and items_per_page -1, return 0
    elsif item_index < items_per_page && item_index >= 0
      return 0
    # if the given item_index is not within the range of 0 to the item_count-1 (to account for 0-based index),
    # return -1
    elsif (0..item_count-1).include?(item_index) == false
      return -1
    # otherwise, figure out which page the item is on using range...
    else
      return  (item_index.to_f / items_per_page.to_f).floor
    end
  end
end

helper = PaginationHelper.new(['a','b','c','d','e','f', 'g', 'h', 'i', 'j'], 4)
puts "should == 2: #{helper.page_count}" # should == 2
puts "should == 6: #{helper.item_count}" # should == 6
puts "should == 4: #{helper.page_item_count(0)}"  # should == 4
puts "should == 2: #{helper.page_item_count(1)}"  # last page - should == 2
puts "should == -1 #{helper.page_item_count(2)}"  # should == -1 since the page is invalid

# page_ndex takes an item index and returns the page that it belongs on
puts helper.page_index(5) # should == 1 (zero based index)
puts helper.page_index(6) # should == 1 (zero based index)
puts helper.page_index(9) # should == 2 (zero based index)

puts helper.page_index(2) # should == 0
puts helper.page_index(20) # should == -1
puts helper.page_index(-10) # should == -1 because negative indexes are invalid