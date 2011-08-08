
namespace GICR {

	public interface Session : GLib.Object {

		public abstract Repository get_repository ();
		public abstract string? get_user_id ();
		public abstract string[] get_attribute_names () ;
		public abstract Value get_attribute_name(string name);
		/* public abstract Workspace? get_workspace (); */
		public abstract Node get_root_node () throws RepositoryError;
		public abstract Session impersonate() throws RepositoryError;
		public abstract Node get_node_by_identifier (Value id);
		public abstract Item get_item (string path);
		public abstract bool item_exists (string path);
		public abstract void move (string srcPath, string destPath);
		public abstract void remove (string path);
		public abstract void save ();
		public abstract void refresh ();
		public abstract bool has_pending_changes ();
		public abstract bool has_permisssion (string path, string action);
		public abstract void check_permission (string path, string action);
		public abstract bool has_capability (string methodname, Item target, HashTable parameters);
		public abstract void importXML (string nodepath, string filepath, int behaviour);
		public abstract void exportSystemView (string absPath, string FixmeOutStream, bool skipBinary, bool recurse);	
		public abstract void exportDocumentView (string absPath, string FixmeOutStream, bool skipBinary, bool recurse);
		public abstract void set_namespace_prefix (string prefix, string uri);
		public abstract string[] get_namespace_prefixes ();
		public abstract string get_namespace_prefix (string uri);
		public abstract void logout ();
		public abstract bool is_live ();
		/* public abstract AccessControlManager get_access_control_manager (); */
		/* public abstract RetentionManager get_retention_manager (); */
	}
}

