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
	 * The Node interface represents a node in a workspace.
	 */
	public interface Node : Object, Item {

		/**
		 * A constant for the JCR name jcr:content. This is the name of
		 * a child node declared in NodeType nt:file and a property declared in
		 * nt:linkedFile.
		 */
		public const string JCR_CONTENT = "{http://www.jcp.org/jcr/1.0}content";

		/**
		 * A constant for the node name jcr:propertyDefinition declared in nt:nodeType.
		 */
		public const string JCR_PROPERTY_DEFINITION = "{http://www.jcp.org/jcr/1.0}propertyDefinition";

		/**
		 * A constant for the node name jcr:childNodeDefinition declared in nt:nodeType.
		 */
		public const string JCR_CHILD_NODE_DEFINITION = "{http://www.jcp.org/jcr/1.0}childNodeDefinition";

		/**
		 * A constant for the node name jcr:rootVersion declared in nt:versionHistory.
		 */
		public const string JCR_ROOT_VERSION = "{http://www.jcp.org/jcr/1.0}rootVersion";

		/**
		 * A constant for the node name jcr:versionLabels declared in nt:versionHistory.
		 */
		public const string JCR_VERSION_LABELS = "{http://www.jcp.org/jcr/1.0}versionLabels";

		/**
		 * A constant for the node name jcr:frozenNode declared in nt:version.
		 */
		public const string JCR_FROZEN_NODE = "{http://www.jcp.org/jcr/1.0}frozenNode";

		/**
		 * Creates a new node at a specified path.
		 *
		 * This is session-write method, meaning that the addition of the new node
		 * is dispatched upon Session#save.
		 *
		 * The relPath provided must not have an index on its final element,
		 * otherwise a RepositoryException is thrown.
		 *
		 * If ordering is supported by the node type of the parent node of the new
		 * node then the new node is appended to the end of the child node list.
		 *
		 * If primaryNodeTypeName is specified, this type will be used (or a
		 * ConstraintViolationException thrown if this child type is not allowed).
		 * Otherwise the new node's primary node type will be determined by the
		 * child node definitions in the node types of its parent. This may occur
		 * either immediately, on dispatch (save, whether within or without
		 * transactions) or on persist (save without transactions, commit within
		 * a transaction), depending on the implementation.
		 *
		 * @param string relPath The path of the new node to be created.
		 * @param string primaryNodeTypeName The name of the primary node type of
		 *      the new node. Optional.
		 *
		 * @return Node The node that was added.
		 *
		 * @throws ItemExistsException if an item at the specified path
		 *      already exists, same-name siblings are not allowed and this
		 *      implementation performs this validation immediately.
		 * @throws PathNotFoundException if the specified path implies
		 *      intermediary Nodes that do not exist or the last element of relPath
		 *      has an index, and this implementation performs this validation
		 *      immediately.
		 * @throws ConstraintViolationException if a node type or
		 *      implementation-specific constraint is violated or if an attempt is
		 *      made to add a node as the child of a property and this
		 *      implementation performs this validation immediately.
		 * @throws VersionException if the node to which the new
		 *      child is being added is read-only due to a checked-in node and this
		 *      implementation performs this validation immediately.
		 * @throws LockException if a lock prevents the addition of the
		 *      node and this implementation performs this validation immediately
		 *      instead of waiting until save.
		 * @throws InvalidArgumentException if $relPath is an absolute path
		 * @throws RepositoryException if the last element of relPath has an
		 *      index or if another error occurs.
		 *
		 */
		public abstract Node add_node (string relPath, string? primaryNodeTypeName) throws ItemExistsException, PathNotFoundException, ConstraintViolationException, VersionException, LockException, InvalidArgumentException, RepositoryException;

		/**
		 * Insert a child node before another child identified by its path.
		 *
		 * If this node supports child node ordering, this method inserts the child
		 * node at srcChildRelPath into the child node list at the position
		 * immediately before destChildRelPath.
		 *
		 * To place the node srcChildRelPath at the end of the list, a
		 * destChildRelPath of null is used.
		 *
		 * Note that (apart from the case where destChildRelPath is null) both of
		 * these arguments must be relative paths of depth one, in other words they
		 * are the names of the child nodes, possibly suffixed with an index.
		 *
		 * If srcChildRelPath and destChildRelPath are the same, then no change is
		 * made.
		 *
		 * This is session-write method, meaning that a change made by this method
		 * is dispatched on save.
		 *
		 * @param srcChildRelPath the relative path to the child node (that
		 *      is, name plus possible index) to be moved in the ordering
		 * @param destChildRelPath the the relative path to the child node
		 *      (that is, name plus possible index) before which the node
		 *      srcChildRelPath will be placed.
		 *
		 * @return void
		 *
		 * @throws UnsupportedRepositoryOperationException if ordering is
		 *      not supported on this node.
		 * @throws ConstraintViolationException if an implementation-
		 *      specific ordering restriction is violated and this implementation
		 *      performs this validation immediately instead of waiting until save.
		 * @throws ItemNotFoundException if either parameter is not the
		 *      relative path of a child node of this node.
		 * @throws VersionException if this node is read-only due to
		 *      a checked-in node and this implementation performs this validation
		 *      immediately.
		 * @throws LockException if a lock prevents the re-ordering and
		 *      this implementation performs this validation immediately.
		 * @throws InvalidArgumentException if srcChildRelPath is an absolute path
		 *      or destChildRelPath is non-null and any of the two paths is of
		 *      depth more than 1.
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract void order_before (string srcChildRelPath, string destChildRelPath) throws UnsupportedRepositoryOperationException, ConstraintViolationException, ItemNotFoundException, VersionException, LockException, InvalidArgumentException , RepositoryException ;

		/**
		 * Defines a value for a property identified by its name.
		 *
		 * Sets the property of this node called $name to the specified value.
		 * This method works as factory method to create new properties and as a
		 * shortcut for Property.set_value ()
		 *
		 * The type detection logic is exactly the same as in
		 * Property.set_value
		 *
		 * If the property does not yet exist, it is created and its property type
		 * determined by the node type of this node. If, based on the name and
		 * value passed, there is more than one property definition that applies,
		 * the repository chooses one definition according to some implementation-
		 * specific criteria. Once property with name P has been created, the
		 * behavior of a subsequent set_property (p,val) may differ across
		 * implementations.
		 * Some repositories may allow P to be dynamically re-bound to a different
		 * property definition (based for example, on the new value being of a
		 * different type than the original value) while other repositories may not
		 * allow such dynamic re-binding.
		 *
		 * If the property type is different than the type of supplied variables, a
		 * best-effort conversion is attempted.
		 *
		 * Passing a null as the second parameter removes the property. It is
		 * equivalent to calling remove on the Property object itself. For example,
		 * n.setProperty("P", null) would remove property called "P" of the
		 * node n.
		 *
		 * This is a session-write method, meaning that changes made through this
		 * method are dispatched on i{@link Session.save}.
		 *
		 * If type is given:
		 * The behavior of this method is identical to that of setProperty($name,
		 * $value) except that the intended property type is explicitly specified.
		 *
		 * Note: 
		 * Have a look at the JSR-283 spec and/or API documentation for more details
		 * on what is supposed to happen for different types of values being passed
		 * to this method.
		 *
		 * @param name The name of a property of this node
		 * @param value The value to be assigned
		 * @param type The type to set for the property, optional. Must be
		 *      a constant from {@link PropertyType}
		 *
		 * @return The new or updated {@link Property} object
		 *
		 * @throws ValueFormatException if the specified property is a DATE
		 *      but the value cannot be expressed in the ISO 8601-based format
		 *      defined in the JCR 2.0 specification and the implementation does
		 *      not support dates incompatible with that format or if value cannot
		 *      be converted to the type of the specified property or if the
		 *      property already exists and is multi-valued.
		 * @throws VersionException if this node is versionable and
		 *      checked-in or is non-versionable but its nearest versionable
		 *      ancestor is checked-in and this implementation performs this
		 *      validation immediately instead of waiting until save.
		 * @throws LockException if a lock prevents the setting of the
		 *      property and this implementation performs this validation
		 *      immediately instead of waiting until save.
		 * @throws ConstraintViolationException if the change would violate
		 *      a node-type or other constraint and this implementation performs
		 *      this validation immediately instead of waiting until save.
		 * @throws RepositoryException if another error occurs.
		 *
		 * @see Property.set_value
		 *
		 */
		public abstract Property set_node_property (string name, Value? val, int? type) throws ValueFormatException, VersionException, LockException, ConstraintViolationException, RepositoryException;

		/**
		 * Returns the node at relPath relative to this node.
		 *
		 * If relPath contains a path element that refers to a node with same-name
		 * sibling nodes without explicitly including an index using the
		 * array-style notation ([x]), then the index [1] is assumed (indexing of
		 * same name siblings begins at 1, not 0, in order to preserve
		 * compatibility with XPath).
		 *
		 * Within the scope of a single Session object, if a Node object has been
		 * acquired, any subsequent call of getNode reacquiring the same node must
		 * return a Node object reflecting the same state as the earlier Node
		 * object. Whether this object is actually the same Node instance, or
		 * simply one wrapping the same state, is up to the implementation.
		 *
		 * @param string relPath The relative path of the node to retrieve.
		 *
		 * @return The node at relPath.
		 *
		 * @throws PathNotFoundException if no node exists at the specified
		 *      path or the current Session does not read access to the node at
		 *      the specified path.
		 * @throws InvalidArgumentException if relPath is an absolute path
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract Node get_node (string relPath) throws PathNotFoundException, InvalidArgumentException, RepositoryException;

		/**
		 * Get a set of nodes gathered by the definition of a filter.
		 *
		 * Gets all child nodes of this node accessible through the current Session
		 * that match one or more of the filter strings in the passed
		 * filter array (if no pattern is given, all accessible child
		 * nodes are returned). Does not include properties of this Node. The
		 * pattern in array, may be a full name or a partial name with one or more wildcard
		 * characters ("*"), or a disjunction (using the "|" character to represent
		 * logical OR) of these.
		 * For example, n.get_nodes("jcr:* | myapp:report | my doc")
		 * would return an array holding all accessible child nodes of N that
		 * are either called 'myapp:report', begin with the prefix 'jcr:' or are
		 * called 'my doc'.
		 *
		 * The substrings within the pattern that are delimited by "|" characters
		 * and which may contain wildcard characters ("*") are called "globs".
		 *
		 * Note that leading and trailing whitespace around a glob is ignored, but
		 * whitespace within a disjunct forms part of the pattern to be matched.
		 *
		 * A glob may be a full name or a partial name with one or more wildcard
		 * characters ("*"). For example,
		 * n.get_nodes(array("jcr:*", "myapp:report", "my doc"))
		 * would return an iterator holding all accessible child nodes of N that
		 * are either called 'myapp:report', begin with the prefix 'jcr:' or are
		 * called 'my doc'.
		 *
		 * Note that unlike in the case of the get_nodes(<string>) leading and
		 * trailing whitespace around a glob is not ignored.
		 *
		 * The pattern is matched against the names (not the paths) of the
		 * immediate child nodes of this node.
		 * 
		 * If this node has no accessible matching child nodes, then an empty
		 * iterator is returned.
		 *
		 * The same reacquisition semantics apply as with get_node (relPath).
		 *
		 * @param filter an array of globbing strings.
		 *
		 * @return array of Node objects or null if none is found
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract Node[] get_nodes (string[]? filter) throws RepositoryException;

		/**
		 * Returns the property at relPath relative to this node.
		 *
		 * The same reacquisition semantics apply as with get_node (string).
		 *
		 * @param relPath The relative path of the property to retrieve.
		 *
		 * @return The {@link Property} object at relPath.
		 * 
		 * @throws PathNotFoundException if no property exists at the
		 *      specified path or if the current Session does not have read access
		 *      to the specified property.
		 * @throws InvalidArgumentException if relPath is an absolute path
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract Property get_node_property (string relPath) throws PathNotFoundException, InvalidArgumentException, RepositoryException ;

		/**
		 * Returns the property of this node with name $name.
		 *
		 * If type is set, attempts to convert the value to the specified type.
		 * This is a shortcut for get_property().getXX()
		 *
		 * @param name Name of this property
		 * @param type Type conversion request, optional. Must be a constriant from {@link PropertyType}
		 *
		 * @return Value The value of the property with name.
		 *
		 * @throws PathNotFoundException if no property exists at the
		 *      specified path or if the current Session does not have read access
		 *      to the specified property.
		 * @throws ValueFormatException if the type or format of the
		 *      property can not be converted to the specified type.
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract Value get_property_value (string name, int? type) throws PathNotFoundException, ValueFormatException, RepositoryException ;

		/**
		 * Get an iteratable set of properties gathered on behalf of a filter.
		 *
		 * Gets all properties of this node accessible through the current Session
		 * that match one or more of the filter strings in the passed
		 * namePattern array (if no pattern is given, all accessible
		 * properties are returned). Does not include child nodes of this node. The
		 * pattern may be a full name or a partial name with one or more wildcard
		 * characters ("*"), or a disjunction (using the "|" character to represent
		 * logical OR) of these. For example,n.get_properties("jcr:* | myapp:name | my doc")
		 * would return an iterator holding all accessible properties of N
		 * that are either called 'myapp:name', begin with the prefix 'jcr:' or are
		 * called 'my doc'.
		 *
		 * The substrings within the pattern that are delimited by "|" characters
		 * and which may contain wildcard characters ("*") are called globs.
		 *
		 * Note that leading and trailing whitespace around a glob is ignored, but
		 * whitespace within a disjunct forms part of the pattern to be matched.
		 *
		 * A glob may be a full name or a partial name with one or more wildcard
		 * characters ("*"). For example, n.get_properties(array("jcr:*", "myapp:report", "my doc"))
		 * would return an array holding all accessible properties of N
		 * that are either called 'myapp:report', begin with the prefix 'jcr:' or
		 * are called 'my doc'.
		 *
		 * Note that unlike in the case of get_properties(<string>) leading and
		 * trailing whitespace around a glob is not ignored.
		 *
		 * The pattern is matched against the names (not the paths) of the
		 * immediate child properties of this node.
		 *
		 * If this node has no accessible matching properties, then an empty
		 * iterator is returned.
		 *
		 * The same reacquisition semantics apply as with get_node (string).
		 *
		 * @param filter a name pattern
		 *
		 * @return array of {@link Property} objects
		 *
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract Property[] get_properties (string[]? filter) throws RepositoryException ;

		/**
		 * Shortcut for getProperties and then getting the values of the properties.
		 *
		 * To improve performance, implementations should avoid instantiating the
		 * property objects for this method
		 *
		 * See Node.get_properties for a full documentation
		 *
		 * @param filter aa array of name patterns
		 * @param dereference whether to dereference REFERENCE,
		 *      WEAKREFERENCE and PATH properties or just return id/path strings
		 *
		 * @return ValueArray 
		 *   If dereference is false, reference properties are uuid strings and
		 *   path properties path strings instead of the referenced node instances.
		 *
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract ValueArray get_properties_values (string[] filter, bool dereference = true) throws RepositoryException ;

		/**
		 * Returns the primary child item of the current node.
		 *
		 * The primary node type of this node may specify one child item (child
		 * node or property) of this node as the primary child item. This method
		 * returns that item.
		 *
		 * In cases where the primary child item specifies the name of a set
		 * same-name sibling child nodes, the node returned will be the one among
		 * the same-name siblings with index [1].
		 *
		 * The same reacquisition semantics apply as with get_node (String).
		 *
		 * @return the primary child {@link Item}.
		 *
		 * @throws ItemNotFoundException if this node does not have a
		 *      primary child item, either because none is declared in the node
		 *      type or because a declared primary item is not present on this node
		 *      instance, or because none accessible through the current Session
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract Item get_primary_item ()  throws RepositoryException, ItemNotFoundException ;

		/**
		 * Returns the identifier of the current node.
		 *
		 * Applies to both referenceable and non-referenceable nodes.
		 *
		 * @return the identifier of this node
		 *
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract string get_identifier ()  throws RepositoryException ;

		/**
		 * This method returns the index of this node within the ordered set of its
		 * same-name sibling nodes.
		 *
		 * This index is the one used to address same-name siblings using the
		 * square-bracket notation, e.g., /a[3]/b[4]. Note that the index always
		 * starts at 1 (not 0), for compatibility with XPath. As a result, for
		 * nodes that do not have same-name-siblings, this method will always
		 * return 1.
		 *
		 * @return The index of this node within the ordered set of its
		 *      same-name sibling nodes.
		 *
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract int get_index() throws RepositoryException;

		/**
		 * This method returns all REFERENCE properties that refer to this node,
		 * have the specified name and that are accessible through the current
		 * Session.
		 *
		 * If the name parameter is null then all referring REFERENCES are returned
		 * regardless of name.
		 *
		 * Some implementations may only return properties that have been
		 * persisted. Some may return both properties that have been persisted and
		 * those that have been dispatched but not persisted (for example, those
		 * saved within a transaction but not yet committed) while others
		 * implementations may return these two categories of property as well as
		 * properties that are still pending and not yet dispatched.et
		 *
		 * In implementations that support versioning, this method does not return
		 * properties that are part of the frozen state of a version in version
		 * storage.
		 *
		 * If this node has no referring properties with the specified name, null is returned.
		 *
		 * @param name Name of referring REFERENCE properties to be
		 *      returned; if null then all referring REFERENCEs are returned.
		 *
		 * @return array of {@link Property} object.
		 *
		 * @throws RepositoryException if an error occurs
		 *
		 */
		public abstract Property[] get_references (string? name) throws RepositoryException;

		/**
		 * This method returns all WEAKREFERENCE properties that refer to this
		 * node, have the specified name and that are accessible through the
		 * current Session.
		 *
		 * If the name parameter is null then all referring WEAKREFERENCE are
		 * returned regardless of name.
		 *
		 * Some level 2 implementations may only return properties that have been
		 * saved (in a transactional setting this includes both those properties
		 * that have been saved but not yet committed, as well as properties that
		 * have been committed). Other level 2 implementations may additionally
		 * return properties that have been added within the current Session but
		 * are not yet saved.
		 *
		 * In implementations that support versioning, this method does not return
		 * properties that are part of the frozen state of a version in version
		 * storage.
		 *
		 * If this node has no referring properties with the specified name, null is returned.
		 *
		 * @param string $name name of referring WEAKREFERENCE properties to be
		 *      returned; if null then all referring WEAKREFERENCEs are returned
		 *
		 * @return an array of {@link Property} objects
		 *
		 * @throws RepositoryException if an error occurs
		 *
		 */
		public abstract Property[] get_weak_references (string? name) throws RepositoryException;

		/**
		 * Indicates whether a node exists at relPath Returns true if a node
		 * accessible through the current Session exists at relPath and false
		 * otherwise.
		 *
		 * @param relPath The path of a (possible) node.
		 *
		 * @return true if a node exists at relPath; false otherwise.
		 *
		 * @throws InvalidArgumentException if relPath is an absolute path
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract bool has_node (string relPath) throws RepositoryException, InvalidArgumentException;

		/**
		 * Determine if a property exists at the specified path.
		 *
		 * Indicates whether a property exists at relPath. Returns true if a
		 * property accessible through the current Session exists at relPath and
		 * false otherwise.
		 *
		 * @param relPath The path of a (possible) property.
		 *
		 * @return true if a property exists at relPath; false otherwise.
		 *
		 * @throws InvalidArgumentException if $relPath is an absolute path
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract bool has_property (string relPath) throws InvalidArgumentException, RepositoryException;

		/**
		 * Indicates whether this node has child nodes.
		 *
		 * Returns true if this node has one or more child nodes accessible through
		 * the current Session; false otherwise.
		 *
		 * @return true if this node has one or more child nodes; false otherwise.
		 *
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract bool has_nodes () throws RepositoryException;

		/**
		 * Indicates whether this node has properties.
		 *
		 * Returns true if this node has one or more properties accessible through
		 * the current Session; false otherwise.
		 *
		 * @return true if this node has one or more properties; false otherwise.
		 *
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract bool has_properties () throws RepositoryException;

		/**
		 * Returns the primary node type in effect for this node.
		 *
		 * Which NodeType is returned when this method is called on the root node
		 * of a workspace is up to the implementation.
		 *
		 * @return NodeTypeInterface a NodeType object.
		 *
		 * @throws RepositoryException if an error occurs
		 *
		 */
		public abstract NodeType get_primary_node_type () throws RepositoryException;

		/**
		 * Returns an array of NodeType objects representing the mixin node types
		 * in effect for this node.
		 *
		 * This includes only those mixin types explicitly assigned to this node.
		 * It does not include mixin types inherited through the addition of
		 * supertypes to the primary type hierarchy or through the addition of
		 * supertypes to the type hierarchy of any of the declared mixin types.
		 *
		 * @return array of {@link NodeType} objects.
		 *
		 * @throws RepositoryException if an error occurs
		 *
		 */
		public abstract NodeType[] get_mixin_node_types () throws RepositoryException;

		/**
		 * Returns true if this node is of the specified primary node type or mixin
		 * type, or a subtype thereof.
		 *
		 * Returns false otherwise. This method respects the effective node type of
		 * the node.
		 *
		 * @param nodeTypeName the name of a node type.
		 *
		 * @return boolean true if this node is of the specified primary node type
		 *            or mixin type, or a subtype thereof. Returns false otherwise.
		 *
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract bool is_node_type (string nodeTypeName) throws RepositoryException;

		/**
		 * Changes the primary node type of this node to nodeTypeName.
		 *
		 * Also immediately changes this node's jcr:primaryType property
		 * appropriately. Semantically, the new node type may take effect
		 * immediately or on dispatch but must take effect on persist. Whichever
		 * behavior is adopted it must be the same as the behavior adopted for
		 * add_mixin() (see below) and the behavior that occurs when a node is first
		 * created.
		 *
		 * @param nodeTypeName the name of the new node type.
		 *
		 * @return void
		 *
		 * @throws ConstraintViolationException if the specified primary
		 *      node type creates a type conflict and this implementation performs
		 *      this validation immediately.
		 * @throws NoSuchNodeTypeException if the specified
		 *      nodeTypeName is not recognized and this implementation performs
		 *      this validation immediately.
		 * @throws VersionException if this node is read-only due to
		 *      a checked-in node and this implementation performs this validation
		 *      immediately.
		 * @throws LockException if a lock prevents the change of the
		 *      primary node type and this implementation performs this validation
		 *      immediately.
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract void set_primary_type (string nodeTypeName) throws RepositoryException, ConstraintViolationException, NoSuchNodeTypeException, VersionException, LockException;

		/**
		 * Adds the mixin node type named mixinName to this node.
		 *
		 * If this node is already of type $mixinName (either due to a previously
		 * added mixin or due to its primary type, through inheritance) then this
		 * method has no effect. Otherwise $mixinName is added to this node's
		 * jcr:mixinTypes property.
		 *
		 * Semantically, the new node type may take effect immediately, on dispatch
		 * or on persist. The behavior is adopted must be the same as the behavior
		 * adopted for set_primary_type () and the behavior that
		 * occurs when a node is first created.
		 *
		 * A ConstraintViolationException is thrown either immediately or on save
		 * if a conflict with another assigned mixin or the primary node type or
		 * for an implementation-specific reason. Implementations may differ on
		 * when this validation is done.
		 *
		 * In some implementations it may only be possible to add mixin types
		 * before a a node is persisted for the first time. In such cases any
		 * later calls to $addMixin will throw a ConstraintViolationException
		 * either immediately, on dispatch or on persist.
		 *
		 * @param mixinName the name of the mixin node type to be added
		 *
		 * @return void
		 *
		 * @throws NoSuchNodeTypeException if the specified
		 *      mixinName is not recognized and this implementation performs this
		 *      validation immediately instead of waiting until save.
		 * @throws ConstraintViolationException if the specified mixin node
		 *      type is prevented from being assigned.
		 * @throws VersionException if this node is versionable and
		 *      checked-in or is non-versionable but its nearest versionable
		 *      ancestor is checked-in and this implementation performs this
		 *      validation immediately instead of waiting until save.
		 * @throws LockException if a lock prevents the addition of the
		 *      mixin and this implementation performs this validation immediately
		 *      instead of waiting until save.
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract void add_mixin (string mixinName) throws LockException, NoSuchNodeTypeException, ConstraintViolationException, VersionException, RepositoryException;

		/**
		 * Removes the specified mixin node type from this node and removes
		 * mixinName from this node's jcr:mixinTypes property.
		 *
		 * Both the semantic change in effective node type and the persistence of
		 * the change to the jcr:mixinTypes  property occur on persist.
		 *
		 * @param mixinName the name of the mixin node type to be removed.
		 *
		 * @return void
		 *
		 * @throws NoSuchNodeTypeException if the specified
		 *      mixinName is not currently assigned to this node and this
		 *      implementation performs this validation immediately.
		 * @throws ConstraintViolationException if the specified mixin node
		 *      type is prevented from being removed and this implementation
		 *      performs this validation immediately.
		 * @throws VersionException if this node is read-only due to
		 *      a checked-in node and this implementation performs this validation
		 *      immediately.
		 * @throws LockException if a lock prevents the removal of the
		 *      mixin and this implementation performs this validation immediately.
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract void remove_mixin (string mixinName) throws NoSuchNodeTypeException, ConstraintViolationException, VersionException, LockException, RepositoryException;

		/**
		 * Determine if a mixin node type may be added to the current node.
		 *
		 * Returns true if the specified mixin node type called $mixinName can be
		 * added to this node. Returns false otherwise. A result of false must be
		 * returned in each of the following cases:
		 * * The mixin's definition conflicts with an existing primary or mixin
		 * node type of this node.
		 * *  This node is versionable and checked-in or is non-versionable and
		 * its nearest versionable ancestor is checked-in.
		 * *  This node is protected (as defined in this node's NodeDefinition,
		 * found in the node type of this node's parent).
		 * *  An access control restriction would prevent the addition of the mixin.
		 * *  A lock would prevent the addition of the mixin.
		 * *  An implementation-specific restriction would prevent the addition of
		 * the mixin.
		 *
		 * @param mixinName The name of the mixin to be tested.
		 *
		 * @return boolean true if the specified mixin node type, mixinName, can be
		 *      added to this node; false otherwise.
		 *
		 * @throws NoSuchNodeTypeException if the specified mixin
		 *      node type name is not recognized.
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract bool can_add_mixin (string mixinName) throws NoSuchNodeTypeException, RepositoryException;

		/**
		 * Returns the node definition that applies to this node.
		 *
		 * In some cases there may appear to be more than one definition that could
		 * apply to this node.
		 * However, it is assumed that upon creation of this node, a single particular
		 * definition was used and it is that definition that this method returns.
		 * How this governing definition is selected upon node creation from among
		 * others which may have been applicable is an implementation issue and is
		 * not covered by this specification. The NodeDefinition returned when this
		 * method is called on the root node of a workspace is also up to the
		 * implementation.
		 *
		 * @return a {@link NodeDefinition} object.
		 *
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract NodeDefinition get_definition () throws RepositoryException;

		/**
		 * Updates a node corresponding to the current one in the given workspace.
		 *
		 * If this node does have a corresponding node in the workspace
		 * srcWorkspace, then this replaces this node and its subgraph with a clone
		 * of the corresponding node and its subgraph.
		 * If this node does not have a corresponding node in the workspace
		 * srcWorkspace, then the update method has no effect.
		 *
		 * If the update succeeds the changes made are persisted immediately, there
		 * is no need to call save.
		 *
		 * Note that update does not respect the checked-in status of nodes. An
		 * update may change a node even if it is currently checked-in (This fact
		 * is only relevant in an implementation that supports versioning).
		 *
		 * @param srcWorkspace the name of the source workspace.
		 *
		 * @return void
		 *
		 * @throws NoSuchWorkspaceException if srcWorkspace does not exist.
		 * @throws InvalidItemStateException if this Session (not
		 *      necessarily this Node) has pending unsaved changes.
		 * @throws AccessDeniedException if the current session does not
		 *      have sufficient access to perform the operation.
		 * @throws LockException if a lock prevents the update.
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract void update (string srcWorkspace) throws NoSuchWorkspaceException, InvalidItemStateException, AccessDeniedException, LockException, RepositoryException;

		/**
		 * Returns the absolute path of the node in the specified workspace that
		 * corresponds to this node.
		 *
		 * @param workspaceName the name of the workspace.
		 *
		 * @return the absolute path to the corresponding node.
		 *
		 * @throws ItemNotFoundException if no corresponding node is found.
		 * @throws NoSuchWorkspaceException if the workspace is unknown.
		 * @throws AccessDeniedException if the current session has
		 *      insufficient access capabilities to perform this operation.
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract string get_corresponding_node_path (string workspaceName) throws ItemNotFoundException, NoSuchWorkspaceException, AccessDeniedException;

		/**
		 * Returns an array of all nodes that are in the shared set of this
		 * node.
		 *
		 * If this node is not shared then the returned iterator contains only this
		 * node.
		 *
		 * @return array of Node objects
		 *
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract Node[] get_shared_set () throws RepositoryException;

		/**
		 * Removes this node and every other node in the shared set of this node.
		 *
		 * This removal must be done atomically, i.e., if one of the nodes cannot
		 * be removed, the method throws the exception Node.remove () would have
		 * thrown in that case, and none of the nodes are removed.
		 *
		 * If this node is not shared this method removes only this node.
		 *
		 * @return void
		 *
		 * @throws VersionException if the parent node of this item
		 * is versionable and checked-in or is non-versionable but its nearest
		 * versionable ancestor is checked-in and this implementation performs
		 * this validation immediately.
		 * @throws LockException if a lock prevents the removal of this
		 * item and this implementation performs this validation immediately.
		 * @throws ConstraintViolationException if removing the
		 * specified item would violate a node type or implementation-specific
		 * conststraint and this implementation performs this validation immediately.
		 * @throws RepositoryException if another error occurs.
		 *
		 * @see remove_share
		 * @see Item.remove
		 * @see Session.remove_item
		 *
		 */
		public abstract void remove_shared_set () throws VersionException, LockException, ConstraintViolationException;

		/**
		 * Removes this node, but does not remove any other node in the shared set
		 * of this node.
		 *
		 * @return void
		 *
		 * @throws VersionException if the parent node of this item
		 * is versionable and checked-in or is non-versionable but its nearest
		 * versionable ancestor is checked-in and this implementation performs
		 * this validation immediately instead of waiting until save.
		 * @throws LockException if a lock prevents the removal of this
		 * item and this implementation performs this validation immediately
		 * instead of waiting until save.
		 * @throws ConstraintViolationException if removing the specified item would 
		 * violate a node type or implementation-specific constraint and this implementation
		 * performs this validation immediately instead of waiting until save.
		 * @throws RepositoryException if this node cannot be removed
		 * without removing another node in the shared set of this node or
		 * another error occurs.
		 *
		 * @see Node.remove_shared_set
		 * @see Item.remove
		 * @see Session.remove_item
		 *
		 */
		public abstract void remove_share () throws VersionException, LockException, ConstraintViolationException, RepositoryException;

		/**
		 * Determine if the current node is currently checked out.
		 *
		 * Returns false if this node is currently in the checked-in state (either
		 * due to its own status as a versionable node or due to the effect of
		 * a versionable node being checked in above it). Otherwise this method
		 * returns true. This includes the case where the repository does not
		 * support versioning (and therefore all nodes are always "checked-out",
		 * by default).
		 *
		 * @return True, if node is checked out, false otherwise
		 *
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract bool is_checked_out() throws RepositoryException;

		/**
		 * Determine if the current node has been locked.
		 *
		 * Returns true if this node is locked either as a result of a lock held
		 * by this node or by a deep lock on a node above this node;
		 * otherwise returns false. This includes the case where a repository does
		 * not support locking (in which case all nodes are "unlocked" by default).
		 *
		 * @return True, if node is locked, false otherwise
		 *
		 * @throws RepositoryException if an error occurs.
		 *
		 */
		public abstract bool is_locked() throws RepositoryException;

		/**
		 * Causes the lifecycle state of this node to undergo the specified
		 * transition.
		 *
		 * This method may change the value of the jcr:currentLifecycleState
		 * property, in most cases it is expected that the implementation will
		 * change the value to that of the passed transition parameter, though this
		 * is an implementation-specific issue. If the jcr:currentLifecycleState
		 * property is changed the change is persisted immediately, there is no
		 * need to call save.
		 *
		 * @param transition a state transition
		 *
		 * @return void
		 *
		 * @throws UnsupportedRepositoryOperationException if this
		 *      implementation does not support lifecycle actions or if this node
		 *      does not have the mix:lifecycle mixin.
		 * @throws InvalidLifecycleTransitionException if the lifecycle
		 *      transition is not successful.
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract void follow_lifecycle_transition (string transition) throws UnsupportedRepositoryOperationException, InvalidLifecycleTransitionException, RepositoryException;

		/**
		 * Returns the list of valid state transitions for this node.
		 *
		 * @return array of valid states
		 *
		 * @throws UnsupportedRepositoryOperationException if this
		 *      implementation does not support lifecycle actions or if this node
		 *      does not have the mix:lifecycle mixin.
		 * @throws RepositoryException if another error occurs.
		 *
		 */
		public abstract string[] get_allowed_lifecycle_transitions () throws UnsupportedRepositoryOperationException, RepositoryException;
	}
}
