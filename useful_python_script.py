if __name__ == "__main__":
	some_list = ['abc-123', 'def-456', 'ghi-789', 'abc-456']
        print "sample list"
        print some_list
        matching = [s for s in some_list if "abc" in s]
        print "find word: %s"%("abc")
        print matching
