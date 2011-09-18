
namespace GICR {


	/**
	 * The entry point into the content repository. 
	 *
	 * The Repository object is usually acquired through the RepositoryFactory. 
	 */
	public interface Repository : GLib.Object {

		/**
		 * The descriptor key for the version of the specification
		 * that this repository implements. For JCR 2.0
		 * the value of this descriptor is the string "2.0".
    		 */
		public const string SPEC_VERSION_DESC = "jcr.specification.version";

		/**
     		 * The descriptor key for the name of the specification
		 * that this repository implements. For JCR 2.0
		 * the value of this descriptor is the string "Content Repository for
		 * Java Technology API".
		 */
		public const string SPEC_NAME_DESC = "jcr.specification.name";

		/**
		 * The descriptor key for the name of the repository vendor.
		 * The descriptor returned for this key is a String.
		 */
		public const string REP_VENDOR_DESC = "jcr.repository.vendor";

		/**
		 * The descriptor key for the URL of the repository vendor.
		 * The descriptor returned for this key is a String.
		 */
		public const string REP_VENDOR_URL_DESC = "jcr.repository.vendor.url";

		/**
		 * The descriptor key for the name of this repository implementation.
		 * The descriptor returned for this key is a String.
		 */
		public const string REP_NAME_DESC = "jcr.repository.name";

		/**
		 * The descriptor key for the version of this repository implementation.
		 * The descriptor returned for this key is a String.
		 */
		public const string REP_VERSION_DESC = "jcr.repository.version";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if repository content can be updated through the JCR API
		 * (as opposed to having read-only access).
		 */
		public const string WRITE_SUPPORTED = "write.supported";

		/**
		 * Key to a String descriptor. Returns one of the following
		 * RepositoryInterface public constants indicating the stability of identifiers:
		 *
		 * * IDENTIFIER_STABILITY_METHOD_DURATION - Identifiers may change between method calls.
		 * * IDENTIFIER_STABILITY_SAVE_DURATION - Identifers are guaranteed stable within a single save/refresh cycle.
		 * * IDENTIFIER_STABILITY_SESSION_DURATION - Identifiers are guaranteed stable within a single session.
		 * * IDENTIFIER_STABILITY_INDEFINITE_DURATION - Identifers are guaranteed to be stable forever.
		 *
		 */
		public const string IDENTIFIER_STABILITY = "identifier.stability";

		/**
		 * One of four possible values for the descriptor IDENTIFIER_STABILITY.
		 * Indicates that identifiers may change between method calls.
		 */
		public const string IDENTIFIER_STABILITY_METHOD_DURATION = "identifier.stability.method.duration";

		/**
		 * One of four possible values for the descriptor IDENTIFIER_STABILITY.
		 * Indicates that identifiers are guaranteed stable within a single save/refresh cycle.
		 */
		public const string IDENTIFIER_STABILITY_SAVE_DURATION = "identifier.stability.save.duration";

		/**
		 * One of four possible values for the descriptor IDENTIFIER_STABILITY.
		 * Indicates that identifiers are guaranteed stable within a single session.
		 */
		public const string IDENTIFIER_STABILITY_SESSION_DURATION = "identifier.stability.session.duration";

		/**
		 * One of four possible values for the descriptor IDENTIFIER_STABILITY.
		 * Indicates that identifiers are guaranteed to be stable forever.
		 */
		public const string IDENTIFIER_STABILITY_INDEFINITE_DURATION = "identifier.stability.indefinite.duration";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if XML export is supported.
		 */
		public const string OPTION_XML_EXPORT_SUPPORTED = "option.xml.export.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if XML import is supported.
		 */
		public const string OPTION_XML_IMPORT_SUPPORTED = "option.xml.import.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if unfiled content is supported.
		 */
		public const string OPTION_UNFILED_CONTENT_SUPPORTED = "option.unfiled.content.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if full versioning is supported.
		 */
		public const string OPTION_VERSIONING_SUPPORTED = "option.versioning.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if simple versioning is supported.
		 */
		public const string OPTION_SIMPLE_VERSIONING_SUPPORTED = "option.simple.versioning.supported";

		/**
		 * Key to a boolean descriptor. Returns true if and only if activities are
		 * supported.
		 */
		public const string OPTION_ACTIVITIES_SUPPORTED = "option.activities.supported";

		/**
		 * Key to a boolean descriptor. Returns true if and only if configurations
		 * and baselines are supported.
		 */
		public const string OPTION_BASELINES_SUPPORTED = "option.baselines.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if access control is supported.
		 */
		public const string OPTION_ACCESS_CONTROL_SUPPORTED = "option.access.control.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if locking is supported.
		 */
		public const string OPTION_LOCKING_SUPPORTED = "option.locking.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if asynchronous observation is supported.
		 */
		public const string OPTION_OBSERVATION_SUPPORTED = "option.observation.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if journaled observation is supported.
		 */
		public const string OPTION_JOURNALED_OBSERVATION_SUPPORTED = "option.journaled.observation.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if retention and hold are supported.
		 */
		public const string OPTION_RETENTION_SUPPORTED = "option.retention.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if lifecycles are supported.
		 */
		public const string OPTION_LIFECYCLE_SUPPORTED = "option.lifecycle.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if transactions are supported.
		 */
		public const string OPTION_TRANSACTIONS_SUPPORTED = "option.transactions.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if workspace management is supported.
		 */
		public const string OPTION_WORKSPACE_MANAGEMENT_SUPPORTED = "option.workspace.management.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if the primary node type of an existing node can be updated.
		 */
		public const string OPTION_UPDATE_PRIMARY_NODETYPE_SUPPORTED = "option.update.primary.nodetype.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if the mixin node types of an existing node can be added and removed.
		 */
		public const string OPTION_UPDATE_MIXIN_NODETYPES_SUPPORTED = "option.update.mixin.nodetypes.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if the creation of shareable nodes is supported.
		 */
		public const string OPTION_SHAREABLE_NODES_SUPPORTED = "option.shareable.nodes.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if node type management is supported.
		 */
		public const string OPTION_NODE_TYPE_MANAGEMENT_SUPPORTED = "option.node.type.management.supported";

		/**
		 * Key to a boolean descriptor. Returns true if and only if node and
		 * property with same name is supported.
		 */
		public const string OPTION_NODE_AND_PROPERTY_WITH_SAME_NAME_SUPPORTED = "option.node.and.property.with.same.name.supported";

		/**
		 * Key to string descriptor. Returns one of the following
		 * RepositoryInterface public constants indicating the level of support for node
		 * type inheritance:
		 *
		 * * NODE_TYPE_MANAGEMENT_INHERITANCE_MINIMAL
		 *
		 * Registration of primary node types is limited to those which have only
		 * nt:base as supertype. Registration of mixin node types is limited to
		 * those without any supertypes.
		 *
		 * * NODE_TYPE_MANAGEMENT_INHERITANCE_SINGLE
		 *
		 * Registration of primary node types is limited to those with exactly one
		 * supertype. Registration of mixin node types is limited to those with at
		 * most one supertype.
		 *
		 * * NODE_TYPE_MANAGEMENT_INHERITANCE_MULTIPLE
		 *
		 * Primary node types can be registered with one or more supertypes. Mixin node
		 * types can be registered with zero or more supertypes.
		 */
		public const string NODE_TYPE_MANAGEMENT_INHERITANCE = "node.type.management.inheritance";

		/**
		 * One of three possible values for the descriptor NODE_TYPE_MANAGEMENT_INHERITANCE.
		 * Indicates that registration of primary node types is limited to those which have only nt:base
		 * as supertype. Registration of mixin node types is limited to those without any supertypes.
		 */
		public const string NODE_TYPE_MANAGEMENT_INHERITANCE_MINIMAL = "node.type.management.inheritance.minimal";

		/**
		 * One of three possible values for the descriptor NODE_TYPE_MANAGEMENT_INHERITANCE.
		 * Indicates that registration of primary node types is limited to those with exactly one supertype.
		 * Registration of mixin node types is limited to those with at most one supertype.
		 */
		public const string NODE_TYPE_MANAGEMENT_INHERITANCE_SINGLE = "node.type.management.inheritance.single";

		/**
		 * One of three possible values for the descriptor NODE_TYPE_MANAGEMENT_INHERITANCE.
		 * Indicates that primary node types can be registered with one or more supertypes.
		 * Mixin node types can be registered with zero or more supertypes.
		 */
		public const string NODE_TYPE_MANAGEMENT_INHERITANCE_MULTIPLE = "node.type.management.inheritance.multiple";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if override of inherited property or child node definitions is supported.
		 */
		public const string NODE_TYPE_MANAGEMENT_OVERRIDES_SUPPORTED = "node.type.management.overrides.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if primary items are supported.
		 */
		public const string NODE_TYPE_MANAGEMENT_PRIMARY_ITEM_NAME_SUPPORTED = "node.type.management.primary.item.name.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if preservation of child node ordering is supported.
		 */
		public const string NODE_TYPE_MANAGEMENT_ORDERABLE_CHILD_NODES_SUPPORTED = "node.type.management.orderable.child.nodes.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if residual property and child node definitions are supported.
		 */
		public const string NODE_TYPE_MANAGEMENT_RESIDUAL_DEFINITIONS_SUPPORTED = "node.type.management.residual.definitions.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if autocreated properties and child nodes are supported.
		 */
		public const string NODE_TYPE_MANAGEMENT_AUTOCREATED_DEFINITIONS_SUPPORTED = "node.type.management.autocreated.definitions.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if same-name sibling child nodes are supported.
		 */
		public const string NODE_TYPE_MANAGEMENT_SAME_NAME_SIBLINGS_SUPPORTED = "node.type.management.same.name.siblings.supported";

		/**
		 * Key to an integer[] descriptor. Returns an array holding the
		 * GICR.PropertyType public constants for the property types
		 * (including UNDEFINED, if supported) that a registered node
		 * type can specify, or a zero-length array if registered node types cannot
		 * specify property definitions.
		 */
		public const string NODE_TYPE_MANAGEMENT_PROPERTY_TYPES = "node.type.management.property.types";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if multivalue properties are supported.
		 */
		public const string NODE_TYPE_MANAGEMENT_MULTIVALUED_PROPERTIES_SUPPORTED = "node.type.management.multivalued.properties.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if registration of a node types with more than one BINARY
		 * property is permitted.
		 */
		public const string NODE_TYPE_MANAGEMENT_MULTIPLE_BINARY_PROPERTIES_SUPPORTED = "node.type.management.multiple.binary.properties.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only value-public constraints are supported.
		 */
		public const string NODE_TYPE_MANAGEMENT_VALUE_CONSTRAINTS_SUPPORTED = "node.type.management.value.public constraints.supported";

		/**
		 * Key to a string[] descriptor. Returns an array holding the
		 * public constants representing the supported query languages, or a zero-length
		 * if query is not supported.
		 */
		public const string QUERY_LANGUAGES = "query.languages";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if stored queries are supported.
		 */
		public const string QUERY_STORED_QUERIES_SUPPORTED = "query.stored.queries.supported";

		/**
		 * Key to a boolean descriptor. Returns true
		 * if and only if full-text search is supported.
		 */
		public const string QUERY_FULL_TEXT_SEARCH_SUPPORTED = "query.full.text.search.supported";

		/**
		 * Key to String descriptor. Returns one of the following
		 * RepositoryInterface public constants indicating the level of support for joins
		 * in queries:
		 *
		 * * QUERY_JOINS_NONE - Joins are not supported. Queries are limited to a single selector.
		 * * QUERY_JOINS_INNER - Inner joins are supported.
		 * * QUERY_JOINS_INNER_OUTER - Inner and outer joins are supported.
		 *
		 * &nbsp;
		 *
		 */
		public const string QUERY_JOINS = "query.joins";

		/**
		 * One of three possible values for the descriptor QUERY_JOINS .
		 * Indicates that joins are not supported. Queries are limited to a single selector.
		 */
		public const string QUERY_JOINS_NONE = "query.joins.none";

		/**
		 * One of three possible values for the descriptor QUERY_JOINS .
		 * Indicates that inner joins are supported.
		 */
		public const string QUERY_JOINS_INNER = "query.joins.inner";

		/**
		 * One of three possible values for the descriptor QUERY_JOINS .
		 * Indicates that inner and outer joins are supported.
		 */
		public const string QUERY_JOINS_INNER_OUTER = "query.joins.inner.outer";


		/**
		 * Authenticates the user using the supplied credentials. 
		 * 
		 * If workspaceName is recognized as the name 
		 * of an existing workspace in the repository and authorization to access that workspace is granted, 
		 * then a new Session object is returned. The format of the string workspaceName depends upon the implementation.
		 *
		 * If credentials is null, it is assumed that authentication is handled by a mechanism external to the 
		 * repository itself (for example, through the JAAS framework) and that the repository implementation exists 
		 * within a context (for example, an application server) that allows it to handle authorization of the 
		 * request for access to the specified workspace. 
		 *
		 * If workspaceName is null, a default workspace is automatically selected by the repository implementation. 
		 * This may, for example, be the "home workspace" of the user whose credentials were passed, though this is 
		 * entirely up to the configuration and implementation of the repository. Alternatively, it may be a "null workspace" 
		 * that serves only to provide the method Workspace.getAccessibleWorkspaceNames(), allowing the client to 
		 * select from among available "real" workspaces.
		 * 
		 * @param credentials The credentials of the user
		 * @param workspaceName The name of a workspace. 
		 *
		 * @return a valid session for the user to access the repository.  
		 * 
		 * @throws LoginException if authentication or authorization (for the specified workspace) fails
		 * @throws NoSuchWorkspaceException if the specified workspaceName is not recognized
		 * @throws RepositoryException if another error occurs
		 *
		 */
		public abstract Session login (Credentials credentials, string? workspace_name) throws RepositoryException;

		/**
		 * Returns a string array holding all descriptor keys available for this implementation.
		 *
		 * Both, the standard descriptors defined by the string public constants in this interface and any
		 * implementation-specific descriptors. Used in conjunction with getDescriptor($key) to query information about
		 * this repository implementation.
		 *
		 * @return array a string array holding all descriptor keys
		 */
		public abstract string[] get_descriptor_keys ();

		/**
		 * Determines if the given identifier is a standard descriptor.
		 *
		 * Returns true if $key is a standard descriptor defined by the string public constants in this interface and
		 * false if it is either a valid implementation-specific key or not a valid key.
		 *
		 * @param key a descriptor key.
		 * @return boolean whether key is a standard descriptor.
		 */
		public abstract bool is_standard_descriptor (string key);
		
		/**
		 * Get the string value(s) for this key.
		 *
		 * @param string $key a descriptor key.
		 * @return mixed a descriptor value in string form or an array of strings for multivalue descriptors
		 */
		public abstract Value get_descriptor (string key);
						
	}		
}

