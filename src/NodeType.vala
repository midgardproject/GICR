/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	public errordomain ConstraintViolationException {
			INTERNAL
	}

	/**
	 * A NodeType object represents a "live" node type that is registered in the repository.
	 *
	 */
	public interface NodeType : Object, NodeTypeDefinition {

		/**
		 * A constant for the node type name nt:base (in extended form).
		 * Constants for the names of the properties declared by nt:base are:
		 *
		 * * Property#JCR_PRIMARY_TYPE
		 * * Property#JCR_MIXIN_TYPES
		 */
		public const string NT_BASE = "{http://www.jcp.org/jcr/nt/1.0}base";

		/**
		 * A constant for the node type name nt:hierarchyNode (in extended form).
		 */
		public const string NT_HIERARCHY_NODE = "{http://www.jcp.org/jcr/nt/1.0}hierarchyNode";

		/**
		 * A constant for the node type name nt:folder (in extended form).
		 */
		public const string NT_FOLDER = "{http://www.jcp.org/jcr/nt/1.0}folder";

		/**
		 * A constant for the node type name nt:file (in extended form).
		 * A constant for the name of the child node declared by nt:file is:
		 * Node#JCR_CONTENT
		 *
		 */
		public const string NT_FILE = "{http://www.jcp.org/jcr/nt/1.0}file";

		/**
		 * A constant for the node type name nt:linkedFile (in extended form).
		 * A constant for the name of the property declared by nt:linkedFile is:
		 * Property#JCR_CONTENT
		 *
		 */
		public const string NT_LINKED_FILE = "{http://www.jcp.org/jcr/nt/1.0}linkedFile";

		/**
		 * A constant for the node type name nt:resource (in extended form).
		 * A constant for the name of the property declared by nt:resource is:
		 * Property#JCR_DATA
		 *
		 */
		public const string NT_RESOURCE = "{http://www.jcp.org/jcr/nt/1.0}resource";

		/**
		 * A constant for the node type name nt:unstructured (in extended form).
		 */
		public const string NT_UNSTRUCTURED = "{http://www.jcp.org/jcr/nt/1.0}unstructured";

		/**
		 * A constant for the node type name nt:address (in extended form).
		 * Constants for the names of the properties declared by nt:base are:
		 *
		 * * Property#JCR_PROTOCOL
		 * * Property#JCR_HOST
		 * * Property#JCR_PORT
		 * * Property#JCR_REPOSITORY
		 * * Property#JCR_WORKSPACE
		 * * Property#JCR_PATH
		 * * Property#JCR_ID
		 */
		public const string NT_ADDRESS = "{http://www.jcp.org/jcr/nt/1.0}address";

		/**
		 * A constant for the node type name mix:referenceable (in extended form).
		 * A constant for the name of the property declared by mix:referenceable is:
		 * Property#JCR_UUID
		 *
		 */
		public const string MIX_REFERENCEABLE = "{http://www.jcp.org/mix/1.0}referenceable";

		/**
		 * A constant for the node type name mix:title (in extended form).
		 * Constants for the names of the properties declared by mix:title are:
		 *
		 * * Property#JCR_TITLE
		 * * Property#JCR_DESCRIPTION
		 */
		public const string MIX_TITLE = "{http://www.jcp.org/mix/1.0}title";

		/**
		 * A constant for the node type name mix:created (in extended form).
		 * Constants for the names of the properties declared by mix:created are:
		 *
		 * * Property#JCR_CREATED
		 * * Property#JCR_CREATED_BY
		 */
		public const string MIX_CREATED = "{http://www.jcp.org/mix/1.0}created";

		/**
		 * A constant for the node type name mix:lastModified (in extended form).
		 * Constants for the names of the properties declared by mix:lastModified are:
		 *
		 * * Property#JCR_LAST_MODIFIED
		 * * Property#JCR_LAST_MODIFIED_BY
		 */
		public const string MIX_LAST_MODIFIED = "{http://www.jcp.org/mix/1.0}lastModified";

		/**
		 * A constant for the node type name mix:language (in extended form).
		 * A constant for the name of the property declared by mix:language is:
		 * Property#JCR_LANGUAGE
		 *
		 */
		public const string MIX_LANGUAGE = "{http://www.jcp.org/mix/1.0}language";

		/**
		 * A constant for the node type name mix:mimeType (in extended form).
		 * Constants for the names of the properties declared by mix:mimeType are:
		 *
		 * * Property#JCR_MIMETYPE
		 * * Property#JCR_ENCODING
		 */
		public const string MIX_MIMETYPE = "{http://www.jcp.org/mix/1.0}mimeType";

		/**
		 * A constant for the node type name nt:nodeType (in extended form).
		 * Constants for the names of the child items declared by nt:nodeType are:
		 *
		 * * Property#JCR_NODE_TYPE_NAME
		 * * Property#JCR_SUPERTYPES
		 * * Property#JCR_IS_ABSTRACT
		 * * Property#JCR_IS_MIXIN
		 * * Property#JCR_HAS_ORDERABLE_CHILD_NODES
		 * * Property#JCR_PRIMARY_ITEM_NAME
		 * * Node#JCR_PROPERTY_DEFINITION
		 * * Node#JCR_CHILD_NODE_DEFINITION
		 */
		public const string NT_NODE_TYPE = "{http://www.jcp.org/jcr/nt/1.0}nodeType";

		/**
		 * A constant for the node type name nt:propertyDefinition (in extended form).
		 * Constants for the names of the properties declared by nt:propertyDefinition are:
		 *
		 * * Property#JCR_NAME
		 * * Property#JCR_AUTOCREATED
		 * * Property#JCR_MANDATORY
		 * * Property#JCR_PROTECTED
		 * * Property#JCR_ON_PARENT_VERSION
		 * * Property#JCR_REQUIRED_TYPE
		 * * Property#JCR_VALUE_CONSTRAINTS
		 * * Property#JCR_DEFAULT_VALUES
		 * * Property#JCR_MULTIPLE
		 */
		public const string NT_PROPERTY_DEFINITION = "{http://www.jcp.org/jcr/nt/1.0}propertyDefinition";

		/**
		 * A constant for the node type name nt:childNodeDefinition (in extended form).
		 * Constants for the names of the properties declared by nt:childNodeDefinition are:
		 *
		 * * Property#JCR_NAME
		 * * Property#JCR_AUTOCREATED
		 * * Property#JCR_MANDATORY
		 * * Property#JCR_PROTECTED
		 * * Property#JCR_ON_PARENT_VERSION
		 * * Property#JCR_REQUIRED_PRIMARY_TYPES
		 * * Property#JCR_DEFAULT_PRIMARY_TYPE
		 * * Property#JCR_SAME_NAME_SIBLINGS
		 */
		public const string NT_CHILD_NODE_DEFINITION = "{http://www.jcp.org/jcr/nt/1.0}childNodeDefinition";

		/**
		 * A constant for the node type name mix:shareable (in extended form).
		 */
		public const string MIX_SHAREABLE = "{http://www.jcp.org/mix/1.0}shareable";

		/**
		 * A constant for the node type name mix:lockable (in extended form).
		 * Constants for the names of the properties declared by mix:lockable are:
		 *
		 * * Property#JCR_LOCK_OWNER
		 * * Property#JCR_LOCK_IS_DEEP
		 */
		public const string MIX_LOCKABLE = "{http://www.jcp.org/mix/1.0}lockable";

		/**
		 * A constant for the node type name mix:lifecycle (in extended form).
		 * Constants for the names of the properties declared by mix:lifecycle are:
		 *
		 * * Property#JCR_LIFECYCLE_POLICY
		 * * Property#JCR_CURRENT_LIFECYCLE_STATE
		 */
		public const string MIX_LIFECYCLE = "{http://www.jcp.org/mix/1.0}lifecycle";

		/**
		 * A constant for the node type name mix:simpleVersionable (in extended form).
		 * A constant for the name of the property declared by mix:simpleVersionable is:
		 * Property#JCR_IS_CHECKED_OUT
		 */
		public const string MIX_SIMPLE_VERSIONABLE = "{http://www.jcp.org/mix/1.0}simpleVersionable";

		/**
		 * A constant for the node type name mix:versionable (in extended form).
		 * Constants for the names of the properties declared by mix:versionable are:
		 *
		 * * Property#JCR_VERSION_HISTORY
		 * * Property#JCR_BASE_VERSION
		 * * Property#JCR_PREDECESSORS
		 * * Property#JCR_MERGE_FAILED
		 * * Property#JCR_ACTIVITY
		 * * Property#JCR_CONFIGURATION
		 */
		public const string MIX_VERSIONABLE = "{http://www.jcp.org/mix/1.0}versionable";

		/**
		 * A constant for the node type name nt:versionHistory (in extended form).
		 * Constants for the names of the child items declared by nt:versionHistory are:
		 *
		 * * Property#JCR_VERSIONABLE_UUID
		 * * Property#JCR_COPIED_FROM
		 * * Node#JCR_ROOT_VERSION
		 * * Node#JCR_VERSION_LABELS
		 */
		public const string NT_VERSION_HISTORY = "{http://www.jcp.org/jcr/nt/1.0}versionHistory";

		/**
		 * A constant for the node type name nt:version (in extended form).
		 * Constants for the names of the child items declared by nt:version are:
		 *
		 * * Property#JCR_CREATED
		 * * Property#JCR_PREDECESSORS
		 * * Property#JCR_SUCCESSORS
		 * * Property#JCR_ACTIVITY
		 * * Node#JCR_FROZEN_NODE
		 */
		public const string NT_VERSION = "{http://www.jcp.org/jcr/nt/1.0}version";

		/**
		 * A constant for the node type name nt:frozenNode (in extended form).
		 * Constants for the names of the properties declared by nt:frozenNode are:
		 *
		 * * Property#JCR_FROZEN_PRIMARY_TYPE
		 * * Property#JCR_FROZEN_MIXIN_TYPES
		 * * Property#JCR_FROZEN_UUID
		 */
		public const string NT_FROZEN_NODE = "{http://www.jcp.org/jcr/nt/1.0}frozenNode";

		/**
		 * A constant for the node type name nt:versionedChild (in extended form).
		 * A constant for the name of the property declared by nt:versionedChild is:
		 * Property#JCR_CHILD_VERSION_HISTORY
		 *
		 */
		public const string NT_VERSIONED_CHILD = "{http://www.jcp.org/jcr/nt/1.0}versionedChild";

		/**
		 * A constant for the node type name nt:activity (in extended form).
		 * A constant for the name of the property declared by nt:activity is:
		 * Property#JCR_TITLE
		 *
		 */
		public const string NT_ACTIVITY = "{http://www.jcp.org/jcr/nt/1.0}activity";

		/**
		 * A constant for the node type name nt:configuration (in extended form).
		 * A constant for the name of the property declared by nt:configuration is:
		 * Property#JCR_ROOT
		 *
		 */
		public const string NT_CONFIGURATION = "{http://www.jcp.org/jcr/nt/1.0}configuration";

		/**
		 * A constant for the node type name nt:query (in extended form).
		 * Constants for the names of the properties declared by nt:query are:
		 *
		 * * Property#JCR_STATEMENT
		 * * Property#JCR_LANGUAGE
		 */
		public const string NT_QUERY = "{http://www.jcp.org/jcr/nt/1.0}query";

		/**#@-*/

		/**
		 * Returns all supertypes of this node type in the node type inheritance
		 * hierarchy.
		 *
		 * For primary types apart from nt:base, this list will always
		 * include at least nt:base. For mixin types, there is no required supertype.
		 *
		 * @return array of NodeType objects.
		 */
		public abstract NodeType[] get_super_types ();

		/**
		 * Returns the direct supertypes of this node type in the node type
		 * inheritance hierarchy, that is, those actually declared in this node
		 * type.
		 *
		 * In single-inheritance systems, this will always be an array of
		 * size 0 or 1. In systems that support multiple inheritance of node
		 * types this array may be of size greater than 1.
		 *
		 * @return array of NodeType objects.
		 */
		public abstract NodeType[] get_declared_supertypes ();

		/**
		 * Returns all subtypes of this node type in the node type inheritance
		 * hierarchy.
		 *
		 * @return array of NodeType objects
		 * @see NodeType.get_declared_subtypes
		 */
		public abstract NodeType[] get_subtypes ();

		/**
		 * Returns the direct subtypes of this node type in the node type inheritance
		 * hierarchy, that is, those which actually declared this node type in their
		 * list of supertypes.
		 *
		 * @return array of NodeType objects
		 * @see NodeType.get_subtypes
		 */
		public abstract NodeType[] get_declared_subtypes ();

		/**
		 * Reports if the name of this node type or any of its direct or indirect supertypes is equal to nodeTypeName.
		 *
		 * @param nodeTypeName the name of a node type.
		 * @return true if the name of this node type or any of its direct or
		 * indirect supertypes is equal to nodeTypeName, otherwise returns false.
		 */
		public abstract bool is_node_type (string nodeTypeName);

		/**
		 * Returns an array containing the property definitions of this node type.
		 *
		 * This includes both those property definitions actually declared
		 * in this node type and those inherited from the supertypes of this type.
		 *
		 * @return array of {@link PropertyDefinition} containing the property definitions.
		 */
		public abstract PropertyDefinition[] get_property_definitions ();

		/**
		 * Returns an array containing the child node definitions of this node type.
		 *
		 * This includes both those child node definitions actually declared in this
		 * node type and those inherited from the supertypes of this node type.
		 *
		 * @return array {@link NodeDefinition} containing the child node definitions.
		 */
		public abstract NodeDefinition[] get_child_node_definitions ();

		/**
		 * Determines if the node type allows to set the value of a property.
		 *
		 * Returns true if setting propertyName to value is allowed by this node type.
		 * Otherwise returns false.
		 *
		 * @param propertyName The name of the property
		 * @param val A variable or an array of variables
		 * @return bool True if setting propertyName to value is allowed by this node type, else false.
		 */
		public abstract bool can_set_property (string propertyName, Value val);

		/**
		 * Determines if this node type allows the addition of a child node.
		 *
		 * Returns true if this node type allows the addition of a child node called
		 * childNodeName without specific node type information (that is, given the
		 * definition of this parent node type, the child node name is sufficient to
		 * determine the intended child node type). Returns false otherwise.
		 * If $nodeTypeName is given returns true if this node type allows the
		 * addition of a child node called childNodeName of node type nodeTypeName.
		 * Returns false otherwise.
		 *
		 * @param childNodeName The name of the child node.
		 * @param nodeTypeName The name of the node type of the child node.
		 * @return bool True, if the node type allows the addition of a child node, else false.
		 */
		public abstract bool can_add_child_node (string childNodeName, string? nodeTypeName);

		/**
		 * Reports if the node type allows the removal of the given node.
		 *
		 * Returns true if removing the child node called nodeName is allowed by this
		 * node type. Returns false otherwise.
		 *
		 * @param nodeName The name of the child node.
		 * @return bool True, if the node type allows to remove the passed node, else false.
		 */
		public abstract bool can_remove_node (string nodeName);

		/**
		 * Determines if the node type allows to remove the property identified by the given name.
		 *
		 * Returns true if removing the property called propertyName is allowed by this
		 * node type. Returns false otherwise.
		 *
		 * @param propertyName The name of the property
		 * @return bool True, if the removal of the property is allowed, else false.
		 */
		public abstract bool can_remove_property (string propertyName);
	}
}
