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

	/**
	 * The property interface describes how an item property shall look like.
	 *
	 * A Property object represents the smallest granularity of content storage.
	 * It has a single parent node and no children. A property consists of a name
	 * and a value, or in the case of multi-value properties, a set of values all
	 * of the same type.
	 */	
	public interface Property : Object, Item {

		/**
		 * A constant for the property name jcr:primaryType (in extended form),
		 * declared in node type nt:base.
		 */
		public const string JCR_PRIMARY_TYPE = "{http://www.jcp.org/jcr/1.0}primaryType";

		/**
		 * A constant for the property name jcr:mixinTypes (in extended form),
		 * declared in node type nt:base.
		 */
		public const string JCR_MIXIN_TYPES = "{http://www.jcp.org/jcr/1.0}mixinTypes";

		/**
		 * A constant for the property name jcr:content (in extended form),
		 * declared in node type nt:linkedFile.
		 *
		 * Note: jcr:content is also the name of a child node declared in nt:file.
		 */
		public const string JCR_CONTENT = "{http://www.jcp.org/jcr/1.0}content";

		/**
		 * A constant for the property name jcr:data (in extended form),
		 * declared in node type nt:resource.
		 */
		public const string JCR_DATA = "{http://www.jcp.org/jcr/1.0}data";

		/**
		 * A constant for the property name jcr:protocol (in extended form),
		 * declared in node type nt:address.
		 */
		public const string JCR_PROTOCOL = "{http://www.jcp.org/jcr/1.0}protocol";

		/**
		 * A constant for the property name jcr:host (in extended form),
		 * declared in node type nt:address.
		 */
		public const string JCR_HOST = "{http://www.jcp.org/jcr/1.0}host";

		/**
		 * A constant for the property name jcr:port (in extended form),
		 * declared in node type nt:address.
		 */
		public const string JCR_PORT = "{http://www.jcp.org/jcr/1.0}port";

		/**
		 * A constant for the property name jcr:repository (in extended form),
		 * declared in node type nt:address.
		 */
		public const string JCR_REPOSITORY = "{http://www.jcp.org/jcr/1.0repository";

		/**
		 * A constant for the property name jcr:workspace (in extended form),
		 * declared in node type nt:address.
		 */
		public const string JCR_WORKSPACE = "{http://www.jcp.org/jcr/1.0}workspace";

		/**
		 * A constant for the property name jcr:path (in extended form),
		 * declared in node type nt:address.
		 */
		public const string JCR_PATH = "{http://www.jcp.org/jcr/1.0}path";

		/**
		 * A constant for the property name jcr:id (in extended form),
		 * declared in node type nt:address.
		 */
		public const string JCR_ID = "{http://www.jcp.org/jcr/1.0}id";

		/**
		 * A constant for the property name jcr:uuid (in extended form),
		 * declared in node type mix:referenceable.
		 */
		public const string JCR_UUID = "{http://www.jcp.org/jcr/1.0}uuid";

		/**
		 * A constant for the property name jcr:title (in extended form),
		 * declared in node types mix:title and nt:activity.
		 */
		public const string JCR_TITLE = "{http://www.jcp.org/jcr/1.0}title";

		/**
		 * A constant for the property name jcr:description (in extended form),
		 * declared in node type mix:title.
		 */
		public const string JCR_DESCRIPTION = "{http://www.jcp.org/jcr/1.0}description";

		/**
		 * A constant for the property name jcr:created (in extended form),
		 * declared in node types mix:created and nt:version.
		 */
		public const string JCR_CREATED = "{http://www.jcp.org/jcr/1.0}created";

		/**
		 * A constant for the property name jcr:createdBy (in extended form),
		 * declared in node type mix:created.
		 */
		public const string JCR_CREATED_BY = "{http://www.jcp.org/jcr/1.0}createdBy";

		/**
		 * A constant for the property name jcr:lastModified (in extended form),
		 * declared in node type mix:lastModified.
		 */
		public const string JCR_LAST_MODIFIED = "{http://www.jcp.org/jcr/1.0}lastModified";

		/**
		 * A constant for the property name jcr:lastModifiedBy (in extended form),
		 * declared in node type mix:lastModified.
		 */
		public const string JCR_LAST_MODIFIED_BY = "{http://www.jcp.org/jcr/1.0}lastModifiedBy";

		/**
		 * A constant for the property name jcr:language (in extended form),
		 * declared in node types mix:language and nt:query.
		 */
		public const string JCR_LANGUAGE = "{http://www.jcp.org/jcr/1.0}language";

		/**
		 * A constant for the property name jcr:mimeType (in extended form),
		 * declared in node type mix:mimeType.
		 */
		public const string JCR_MIMETYPE = "{http://www.jcp.org/jcr/1.0}mimeType";

		/**
		 * A constant for the property name jcr:encoding (in extended form),
		 * declared in node type mix:mimeType.
		 */
		public const string JCR_ENCODING = "{http://www.jcp.org/jcr/1.0}encoding";

		/**
		 * A constant for the property name jcr:nodeTypeName (in extended form),
		 * declared in node type nt:nodeType.
		 */
		public const string JCR_NODE_TYPE_NAME = "{http://www.jcp.org/jcr/1.0}nodeTypeName";

		/**
		 * A constant for the property name jcr:supertypes (in extended form),
		 * declared in node type nt:nodeType.
		 */
		public const string JCR_SUPERTYPES = "{http://www.jcp.org/jcr/1.0}supertypes";

		/**
		 * A constant for the property name jcr:isAbstract (in extended form),
		 * declared in node type nt:nodeType.
		 */
		public const string JCR_IS_ABSTRACT = "{http://www.jcp.org/jcr/1.0}isAbstract";

		/**
		 * A constant for the property name jcr:isMixin (in extended form),
		 * declared in node type nt:nodeType.
		 */
		public const string JCR_IS_MIXIN = "{http://www.jcp.org/jcr/1.0}isMixin";

		/**
		 * A constant for the property name jcr:hasOrderableChildNodes (in extended form),
		 * declared in node type nt:nodeType.
		 */
		public const string JCR_HAS_ORDERABLE_CHILD_NODES = "{http://www.jcp.org/jcr/1.0}hasOrderableChildNodes";

		/**
		 * A constant for the property name jcr:primaryItemName (in extended form),
		 * declared in node type nt:nodeType.
		 */
		public const string JCR_PRIMARY_ITEM_NAME = "{http://www.jcp.org/jcr/1.0}primaryItemName";

		/**
		 * A constant for the property name jcr:name (in extended form),
		 * declared in node types nt:propertyDefinition and nt:childNodeDefinition.
		 */
		public const string JCR_NAME = "{http://www.jcp.org/jcr/1.0}name";

		/**
		 * A constant for the property name jcr:autoCreated (in extended form),
		 * declared in node types nt:propertyDefinition and nt:childNodeDefinition.
		 */
		public const string JCR_AUTOCREATED = "{http://www.jcp.org/jcr/1.0}autoCreated";

		/**
		 * A constant for the property name jcr:mandatory (in extended form),
		 * declared in node types nt:propertyDefinition and nt:childNodeDefinition.
		 */
		public const string JCR_MANDATORY = "{http://www.jcp.org/jcr/1.0}mandatory";

		/**
		 * A constant for the property name jcr:protected (in extended form),
		 * declared in node types nt:propertyDefinition and nt:childNodeDefinition.
		 */
		public const string JCR_PROTECTED = "{http://www.jcp.org/jcr/1.0}protected";

		/**
		 * A constant for the property name jcr:onParentVersion (in extended form),
		 * declared in node types nt:propertyDefinition and nt:childNodeDefinition.
		 */
		public const string JCR_ON_PARENT_VERSION = "{http://www.jcp.org/jcr/1.0}onParentVersion";

		/**
		 * A constant for the property name jcr:requiredType (in extended form),
		 * declared in node type nt:propertyDefinition.
		 */
		public const string JCR_REQUIRED_TYPE = "{http://www.jcp.org/jcr/1.0}requiredType";

		/**
		 * A constant for the property name jcr:valueConstraints (in extended form),
		 * declared in node type nt:propertyDefinition.
		 */
		public const string JCR_VALUE_CONSTRAINTS = "{http://www.jcp.org/jcr/1.0}valueConstraints";

		/**
		 * A constant for the property name jcr:defaultValues (in extended form),
		 * declared in node type nt:propertyDefinition.
		 */
		public const string JCR_DEFAULT_VALUES = "{http://www.jcp.org/jcr/1.0}defaultValues";

		/**
		 * A constant for the property name jcr:multiple (in extended form),
		 * declared in node type nt:propertyDefinition.
		 */
		public const string JCR_MULTIPLE = "{http://www.jcp.org/jcr/1.0}multiple";

		/**
		 * A constant for the property name jcr:requiredPrimaryTypes (in extended form),
		 * declared in node type nt:childNodeDefinition.
		 */
		public const string JCR_REQUIRED_PRIMARY_TYPES = "{http://www.jcp.org/jcr/1.0}requiredPrimaryTypes";

		/**
		 * A constant for the property name jcr:defaultPrimaryType (in extended form),
		 * declared in node type nt:childNodeDefinition.
		 */
		public const string JCR_DEFAULT_PRIMARY_TYPE = "{http://www.jcp.org/jcr/1.0}defaultPrimaryType";

		/**
		 * A constant for the property name jcr:sameNameSiblings (in extended form),
		 * declared in node type nt:childNodeDefinition.
		 */
		public const string JCR_SAME_NAME_SIBLINGS = "{http://www.jcp.org/jcr/1.0}sameNameSiblings";

		/**
		 * A constant for the property name jcr:lockOwner (in extended form),
		 * declared in node type mix:lockable.
		 */
		public const string JCR_LOCK_OWNER = "{http://www.jcp.org/jcr/1.0}lockOwner";

		/**
		 * A constant for the property name jcr:lockIsDeep (in extended form),
		 * declared in node type mix:lockable.
		 */
		public const string JCR_LOCK_IS_DEEP = "{http://www.jcp.org/jcr/1.0}lockIsDeep";

		/**
		 * A constant for the property name jcr:lifecyclePolicy (in extended form),
		 * declared in node type mix:lifecycle.
		 */
		public const string JCR_LIFECYCLE_POLICY = "{http://www.jcp.org/jcr/1.0}lifecyclePolicy";

		/**
		 * A constant for the property name jcr:currentLifecycleState (in extended form),
		 * declared in node type mix:lifecycle.
		 */
		public const string JCR_CURRENT_LIFECYCLE_STATE = "{http://www.jcp.org/jcr/1.0}currentLifecycleState";

		/**
		 * A constant for the property name jcr:isCheckedOut (in extended form),
		 * declared in node type mix:simpleVersionable.
		 */
		public const string JCR_IS_CHECKED_OUT = "{http://www.jcp.org/jcr/1.0}isCheckedOut";

		/**
		 * A constant for the property name jcr:frozenPrimaryType (in extended form),
		 * declared in node type nt:frozenNode.
		 */
		public const string JCR_FROZEN_PRIMARY_TYPE = "{http://www.jcp.org/jcr/1.0}frozenPrimaryType";

		/**
		 * A constant for the property name jcr:frozenMixinTypes (in extended form),
		 * declared in node type nt:frozenNode.
		 */
		public const string JCR_FROZEN_MIXIN_TYPES = "{http://www.jcp.org/jcr/1.0}frozenMixinTypes";

		/**
		 * A constant for the property name jcr:frozenUuid (in extended form),
		 * declared in node type nt:frozenNode.
		 */
		public const string JCR_FROZEN_UUID = "{http://www.jcp.org/jcr/1.0}frozenUuid";

		/**
		 * A constant for the property name jcr:versionHistory (in extended form),
		 * declared in node type mix:versionable.
		 */
		public const string JCR_VERSION_HISTORY = "{http://www.jcp.org/jcr/1.0}versionHistory";

		/**
		 * A constant for the property name jcr:baseVersion (in extended form),
		 * declared in node type mix:versionable.
		 */
		public const string JCR_BASE_VERSION = "{http://www.jcp.org/jcr/1.0}baseVersion";

		/**
		 * A constant for the property name jcr:predecessors (in extended form),
		 * declared in node types mix:versionable and nt:version.
		 */
		public const string JCR_PREDECESSORS = "{http://www.jcp.org/jcr/1.0}predecessors";

		/**
		 * A constant for the property name jcr:mergeFailed (in extended form),
		 * declared in node type mix:versionable.
		 */
		public const string JCR_MERGE_FAILED = "{http://www.jcp.org/jcr/1.0}mergeFailed";

		/**
		 * A constant for the property name jcr:activity (in extended form),
		 * declared in node types mix:versionable and nt:version.
		 */
		public const string JCR_ACTIVITY = "{http://www.jcp.org/jcr/1.0}activity";

		/**
		 * A constant for the property name jcr:configuration (in extended form),
		 * declared in node type mix:versionable.
		 */
		public const string JCR_CONFIGURATION = "{http://www.jcp.org/jcr/1.0}configuration";

		/**
		 * A constant for the property name jcr:versionableUuid (in extended form),
		 * declared in node type nt:version.
		 */
		public const string JCR_VERSIONABLE_UUID = "{http://www.jcp.org/jcr/1.0}versionableUuid";

		/**
		 * A constant for the property name jcr:copiedFrom (in extended form),
		 * declared in node type nt:version.
		 */
		public const string JCR_COPIED_FROM = "{http://www.jcp.org/jcr/1.0}copiedFrom";

		/**
		 * A constant for the property name jcr:successors (in extended form),
		 * declared in node type nt:version.
		 */
		public const string JCR_SUCCESSORS = "{http://www.jcp.org/jcr/1.0}successors";

		/**
		 * A constant for the property name jcr:childVersionHistory (in extended form),
		 * declared in node type nt:versionedChild.
		 */
		public const string JCR_CHILD_VERSION_HISTORY = "{http://www.jcp.org/jcr/1.0}childVersionHistory";

		/**
		 * A constant for the property name jcr:root (in extended form),
		 * declared in node type nt:configuration.
		 */
		public const string JCR_ROOT = "{http://www.jcp.org/jcr/1.0}root";

		/**
		 * A constant for the property name jcr:statement (in extended form),
		 * declared in node type nt:query.
		 */
		public const string JCR_STATEMENT = "{http://www.jcp.org/jcr/1.0}statement";

		/**
		 * Sets the value of this property to the value.
		 *
		 * If the type parameter is set, the property is set to that type and the
		 * value converted into that type. If the node type does not allow the type
		 * an exception is thrown.
		 *
		 * If no explicit type is given, then it is derived from the value. (First
		 * value in case of multivalue property.)
		 * If the node type allows the type of the parameter, the property changes
		 * its type to the type of the value. Otherwise, a best-effort conversion
		 * is attempted.
		 *
		 * If value is of type PropertyInterface, the value of the property is
		 * copied into this property. (If type is set, the property value is
		 * converted into this type, otherwise the type of the property is used
		 * as explained above.
		 * This can be used to copy a binary from one property into another without
		 * getting the stream. The implemenation should take care to detect the
		 * case and copy the binary data directly in the backend for optimal
		 * performance.
		 *
		 * The type detection follows PropertyType::determineType. Thus, passing a
		 * Node object without an explicit type (REFERENCE or WEAKREFERENCE) will
		 * create a REFERENCE property. If the specified node is not referenceable,
		 * a ValueFormatException is thrown.
		 *
		 * To create a PATH property with a reference to an other property, you can
		 * call setValue with the path of the other property and the PATH type
		 * constant. Passing the property itself and the PATH type will convert the
		 * value of the property to a path.
		 *
		 * When assigning a stream resource to create a binary property, the client
		 * application must leave the stream alone afterwards. The PHPCR
		 * implementation is responsible for closing it after saving.
		 *
		 * This method is a session-write and therefore requires a <code>save</code>
		 * to dispatch the change.
		 *
		 * If value is an array:
		 * If this property is not multi-valued then a ValueFormatException is
		 * thrown immediately.
		 * @see Property.set_values
		 *
		 * @param mixed $value The value to set
		 * @param integer $type Type request for the property, optional. Must be a constant from PropertyType
		 *
		 * @return void
		 *
		 * @throws ValueFormatException if the type or format of the specified value is incompatible with the type
		 *                                     of this property.
		 * @throws VersionException if this property belongs to a node that is read-only due to a checked-in
		 *                                         node and this implementation performs this validation immediately.
		 * @throws LockException if a lock prevents the setting of the value and this implementation performs
		 *                                   this validation immediately.
		 * @throws ConstraintViolationException if the change wouldva violate a node-type or other constraint and
		 *                                             this implementation performs this validation immediately.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void set_value (Value val, int type) throws ValueFormatException, VersionException, LockException, ConstraintViolationException, RepositoryException;

		/**
		 * Sets the values of this property
		 *
		 * @see Property.set_value
		 */
		public abstract void set_values (ValueArray values, int type) throws ValueFormatException, VersionException, LockException, ConstraintViolationException, RepositoryException;			

		/**
		 * Get the value in format default for the PropertyType of this property.
		 *
		 * In case of a binary property, this is the stream of binary data.
		 *
		 * @return value of this property
		 *
		 * @throws ValueFormatException if the property is multi-valued. 
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract Value get_value () throws ValueFormatException, RepositoryException;

		/**
		 * Get the value in format default for the PropertyType of this property.
		 *
		 * In case of a binary property, this is the stream of binary data.
		 *
		 * @return array of values of this property
		 *
		 * @throws ValueFormatException if the property is single-valued. 
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract ValueArray get_values () throws ValueFormatException, RepositoryException;


		/**
		 * Returns a String representation of the value of this property.
		 *
		 * @throws ValueFormatException if conversion to a String is not possible
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract string get_string () throws ValueFormatException, RepositoryException;

		/**
		 * Returns a Binary representation of the value of this property.
		 *
		 * The Binary object in turn provides methods to access the binary data
		 * itself. Uses the standard conversion to binary (see JCR specification).
		 *
		 * @return  IOStream resource if the underlying binary
		 *
		 * @throws RepositoryException if another error occurs
		 */
		public abstract GLib.DataInputStream get_binary () throws RepositoryException;

		/**
		 * Returns a long  representation of the value of this property.
		 *
		 * @return long
		 *
		 * @throws ValueFormatException if conversion to integer is not possible
		 * @throws RepositoryException if another error occurs
		 */
		public abstract long get_long () throws ValueFormatException, RepositoryException;

		/**
		 * Returns double representation of the value of this property.
		 *
		 * @return double
		 *
		 * @throws ValueFormatException if conversion to a double is not possible
		 * @throws RepositoryException if another error occurs
		 */
		public abstract double get_double () throws ValueFormatException, RepositoryException;

		/**
		 * Returns an arbitrary precision number 
		 *
		 * @return float
		 *
		 * @throws ValueFormatException if conversion to a number string is not possible
		 * @throws RepositoryException if another error occurs
		 */
		public abstract float get_float () throws ValueFormatException, RepositoryException;

		/**
		 * Returns a DateTime representation of the value of this property.
		 *
		 * The object returned is a copy of the stored value, so changes to it are
		 * not reflected in internal storage.
		 *
		 * @return DateTime A date representation of the value of this property
		 *
		 * @throws ValueFormatException if conversion to \DateTime is not possible
		 * @throws RepositoryException if another error occurs
		 */
		public abstract DateTime get_date () throws ValueFormatException, RepositoryException;

		/**
		 * Returns a boolean representation of the value of this property.
		 *
		 * @return bool A boolean representation of the value of this property
		 *
		 * @throws ValueFormatException if conversion to a boolean is not possible
		 * @throws RepositoryException if another error occurs
		 */
		public abstract bool get_boolean () throws ValueFormatException, RepositoryException;

		/**
		 * Gets the node the property refers to by its type.
		 *
		 * If this property is of type REFERENCE, WEAKREFERENCE or PATH (or
		 * convertible to one of these types) this method returns the Node to
		 * which this property refers.
		 * If this property is of type PATH and it contains a relative path, it is
		 * interpreted relative to the parent node of this property. For example "."
		 * refers to the parent node itself, ".." to the parent of the parent node
		 * and "foo" to a sibling node of this property.
		 *
		 * If you do not want to dereference the nodes yet, you can use getString
		 * to get the unique ids and use the SessionInterface::getNodeByIdentifier
		 * as all referenced nodes are referenciable and thus must have a uuid.
		 * If its a PATH property, you will need the node of this property and use
		 * getNodes to get the nodes with relative or absolute path.
		 *
		 * @return NodeInterface the referenced Node, or an array of Nodes for multi-valued properties.
		 *
		 * @throws ValueFormatException if this property cannot be converted to a referring type
		 *                                     (REFERENCE, WEAKREFERENCE or PATH) or if this property is a referring
		 *                                     type but is currently part of the frozen state of a version in version
		 *                                     storage.
		 * @throws ItemNotFoundException If this property is of type PATH or WEAKREFERENCE and no target node
		 *                                      accessible by the current Session exists in this workspace. Note that this
		 *                                      applies even if the property is a PATH and a property exists at the
		 *                                      specified location. To dereference to a target property (as opposed to a
		 *                                      target node), the method PropertyInterface::getProperty() is used.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract Node get_node () throws ValueFormatException, RepositoryException, ItemNotFoundException;

		/**
		 * Gets the property the property refers to by its type.
		 *
		 * If this property is of type PATH (or convertible to this type) this
		 * method returns the Property to which this property refers.
		 * If this property contains a relative path, it is interpreted relative
		 * to the parent node of this property. Therefore, when resolving such a
		 * relative path, the segment "." refers to the parent node itself, ".." to
		 * the parent of the parent node and "foo" to a sibling property of this
		 * property or this property itself.
		 *
		 * For example, if this property is located at /a/b/c and it has a value of
		 * "../d" then this method will return the property at /a/d if such exists.
		 *
		 * @return PropertyInterface the referenced property, or an array of properties for multi-valued properties.
		 *
		 * @throws ValueFormatException if this property cannot be converted to a PATH or if this property is a
		 *                                     referring type but is currently part of the frozen state of a version in
		 *                                     version storage.
		 * @throws ItemNotFoundException If no property accessible by the current Session exists in this workspace
		 *                                      at the specified path. Note that this applies even if a node exists at
		 *                                      the specified location. To dereference to a target node, the method
		 *                                      PropertyInterface::getNode() is used.
		 * @throws RepositoryException if another error occurs
		 */
		public abstract Property get_node_property () throws ValueFormatException, RepositoryException, ItemNotFoundException;

		/**
		 * Returns the length of the value of this property.
		 *
		 * For a BINARY property, getLength returns the number of bytes.
		 * For other property types, getLength returns the same value that would be
		 * returned by calling strlen() on the value when it has been converted to a
		 * STRING according to standard JCR propety type conversion.
		 *
		 * Returns -1 if the implementation cannot determine the length.
		 *
		 * For multivalue properties, the same rules apply, but returns an array of lengths
		 * with the same order as the values have in getValue
		 *
		 * @return long
		 * @see Property.get_lengths
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract long get_length () throws RepositoryException;

		/**
		 * Returns the lengths of the values of this property.
		 *
		 * @return array of long
		 * @see Property.get_length
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract long get_lengths () throws RepositoryException;

		/**
		 * Returns the property definition that applies to this property. In some
		 * cases there may appear to be more than one definition that could apply
		 * to this node. However, it is assumed that upon creation or change of
		 * this property, a single particular definition is chosen by the
		 * implementation. It is that definition that this method returns. How this
		 * governing definition is selected upon property creation or change from
		 * among others which may have been applicable is an implementation issue
		 * and is not covered by this specification.
		 *
		 * @return {@link PropertyDefinition} object.
		 *
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract PropertyDefinition get_definition () throws RepositoryException;

		/**
		 * Returns the type of this Property.
		 *
		 * Following property types are available:
		 * * PropertyType::STRING
		 * * PropertyType::BINARY
		 * * PropertyType::DATE
		 * * PropertyType::DOUBLE
		 * * PropertyType::LONG
		 * * PropertyType::BOOLEAN
		 * * PropertyType::NAME
		 * * PropertyType::PATH
		 * * PropertyType::REFERENCE
		 * * PropertyType::WEAKREFERENCE
		 * * PropertyType::URI
		 *
		 * The type returned is that which was set at property creation. Note that
		 * for some property p, the type returned by $p->get_type() will differ from
		 * the type returned by p.get_definition()->get_required_type() only in the case
		 * where the latter returns UNDEFINED. The type of a property instance is
		 * never UNDEFINED (it must always have some actual type).
		 *
		 * @return unsigned integer The numerical representation of a property type.
		 *
		 * @throws RepositoryException if an error occurs
		 */
		public abstract uint get_property_type () throws RepositoryException;

		/**
		 * Determines if the current property is multi-valued.
		 *
		 * Returns true if this property is multi-valued and false if this property
		 * is single-valued.
		 *
		 * @return boolean true if this property is multi-valued; false otherwise.
		 *
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract bool is_multiple () throws RepositoryException;
	}
}
