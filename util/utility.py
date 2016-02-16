import pickle
class PickleUtil(object):
   @staticmethod
   def load_pickle(_dir):
      temp_dict = dict()
      with open(_dir,"rb") as handle:
         temp_dict = pickle.load(handle)
      return temp_dict
