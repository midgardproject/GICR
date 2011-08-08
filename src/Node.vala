
namespace GICR {

    public interface Node : GLib.Object, Item {

        public abstract Node add_node (string rel_path, string? primary_node_type_name);

        public abstract void order_before (string src_child_rel_path, string dest_child_rel_path);

        public abstract Property set_property (string name, string value, int? null);

        public abstract Node get_node (string rel_path);

        public abstract Node[] get_nodes (string? filter);

        public abstract Property get_property (string rel_path);

        public abstract Value get_property_value (string name, int? type);

        public abstract Property[] get_properties (string? filter);

        public abstract Item get_primary_item ();

        public abstract string get_identifier ();

        public abstract int get_index ();

        public abstract Property[] get_references (string? name);

        public abstract Property[] get_weak_references (string? name);

        public abstract bool has_node (string rel_path);

        public abstract bool has_property (string rel_path);

        public abstract bool has_nodes ();

        public abstract bool has_properties ();

        /*
         public abstract NodeType get_primary_node_type ();

         public abstract NodeType[] get_mixin_node_types ();

         public abstract bool is_node_type (string node_type_name);

         public abstract void set_primary_type (string node_type_name);

         public abstract void add_mixin (string mixin_name);

         public abstract void remove_mixin (string mixin_name);

         public abstract bool can_add_mixin (string mixin_name);

         public abstract NodeDefinition get_definition ();
        */

        public abstract void update (string src_workspace);

        public abstract string get_corresponding_node_path (string workspace_name);

        public abstract Node[] get_shared_set ();

        public abstract void remove_shared_set ();

        public abstract void remove_share ();

        public abstract bool is_checked_out ();

        public abstract bool is_locked ();

        /*
         public abstract void follow_lifecycle_transition (string transition);

         public abstract string[] get_allowed_lifecycle_transitions ();
        */

    }
}
