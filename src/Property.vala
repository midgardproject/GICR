namespace GICR {

    public interface Property : GLib.Object, Item {

        public abstract void set_value (Value value, int? type) throws RepositoryException, ValueError;

        public abstract void add_value (Value value) throws ValueError;

        public abstract Value get_value ();

        public abstract string get_string () throws RepositoryException, ValueError;

        /*
         public abstract GioStream get_binary () throws RepositoryException, ValueError;
        */

        public abstract long get_long () throws RepositoryException, ValueError;

        public abstract double get_double () throws RepositoryException, ValueError;

        public abstract float get_decimal () throws RepositoryException, ValueError;

        /*
         public abstract datetime get_date () throws RepositoryException, ValueError;
        */

        public abstract bool get_boolean () throws RepositoryException, ValueError;

        public abstract Node get_node () throws RepositoryException, ItemError;

        public abstract Property get_property () throws RepositoryException, ItemError;

        public abstract int get_length () throws RepositoryException;

        /*
         public abstract PropertyDefinition get_definition () throws RepositoryException;
        */

        public abstract int get_value_type () throws RepositoryException;

        public abstract bool is_multiple () throws RepositoryException;

    }

}
